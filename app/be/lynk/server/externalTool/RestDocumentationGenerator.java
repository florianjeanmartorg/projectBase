package be.lynk.server.externalTool;

import be.lynk.server.dto.technical.DTO;
import be.lynk.server.externalTool.util.FileUtil;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.core.JsonProcessingException;

import javax.validation.constraints.NotNull;
import java.io.File;
import java.lang.annotation.Annotation;
import java.lang.reflect.Field;
import java.lang.reflect.ParameterizedType;
import java.util.*;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Created by flo on 09/12/15.
 */
public class RestDocumentationGenerator {

    private static final String CONTROLLER_PATH = "/controller";
    private static final String DTO_PATH = "be.lynk.server.dto.";

    private static final String DOC_FILE_TARGET = "project_documentation/rest/index.html";
    private static final String DOC_CLASS_TARGET = "project_documentation/rest/class.html";

    private static final String ROUTES_PATH = "conf/routes";
    private static final String SOURCE_PATH = "app";

    //regex
    private static final Pattern ROUTE_PATTERN = Pattern.compile("^(POST|GET|DELETE|PUT) *([^ ]*) *(@.*)$");
    private static final Pattern CONTROLLER_CALL_PATTERN = Pattern.compile("^@(.*)\\.([^\\.]*)\\(");
    private static final Pattern DOCUMENTATION_PATTERN = Pattern.compile("/\\*{2}(.*?)\\*/.*?(public|private|protected) .*? (.*?)(\\(| )");
    private static final Pattern DOC_DESC = Pattern.compile("^[ \\*]*(.*?)[ \\*]*(@|$)", Pattern.DOTALL);
    private static final Pattern DOC_PARAM = Pattern.compile("@param (.*?) (.*?) *\\*", Pattern.DOTALL);
    private static final Pattern DOC_DTO = Pattern.compile("@dto (.*?) *\\*", Pattern.DOTALL);
    private static final Pattern DOC_RESULT = Pattern.compile("@return (.*?) *\\*", Pattern.DOTALL);
    private static final Pattern DOC_EXCEPTION = Pattern.compile("@commonException (.*?) *\\*", Pattern.DOTALL);
    private static final Pattern DOC_SECURITY = Pattern.compile("@secutiry (.*?) *\\*", Pattern.DOTALL);

    private static final Map<String, String> DTO_MAP = new HashMap<>();
    private static final int SPACING = 20;


    public static void main(String[] args) {


        try {
            //read routes map
            File routeFile = new File(ROUTES_PATH);

            String result = "<!DOCTYPE html><header><link rel=\"stylesheet\" media=\"screen\" href=\"style.css\"></header><body>";


            for (String line : FileUtil.getStringByLine(routeFile)) {

                Matcher matcher = ROUTE_PATTERN.matcher(line);

                if (matcher.find()) {

                    //load route elements
                    String httpRequestType = matcher.group(1);
                    String route = matcher.group(2);
                    String constrollerCall = matcher.group(3);
                    Matcher controllerCallMatcher = CONTROLLER_CALL_PATTERN.matcher(constrollerCall);
                    controllerCallMatcher.find();
                    String controller = controllerCallMatcher.group(1);
                    String fct = controllerCallMatcher.group(2);

                    //load controller class
                    File controllerFile = new File(SOURCE_PATH + "/" + controller.replace(".", "/") + ".java");

                    String controllerString = FileUtil.getString(controllerFile);
                    controllerString = controllerString.replace(FileUtil.RETURN_REGEX, "");

                    Matcher docMatcher = DOCUMENTATION_PATTERN.matcher(controllerString);

                    boolean founded = false;

                    while (docMatcher.find()) {
                        String doc = docMatcher.group(1);
                        String linkedFct = docMatcher.group(3);

                        if (linkedFct.equals(fct)) {
                            //doc found !
                            founded = true;

                            result += createDoc(httpRequestType, route, doc);
                            break;
                        }
                    }

                    if (!founded) {
                        System.out.println("CANNOT FOuND DOC FOR " + controller + "." + fct);
                    }

                }

            }


            result += "</body>";

            //write doc
            FileUtil.save(result, DOC_FILE_TARGET, true);

            //write class doc
            String content = "<!DOCTYPE html><header><link rel=\"stylesheet\" media=\"screen\" href=\"style.css\"></header><body>";
            for (Map.Entry<String, String> stringStringEntry : DTO_MAP.entrySet()) {
                content += "<h2 href='#" + stringStringEntry.getKey() + "'>" + getDTOName(stringStringEntry.getKey()) + "</h2>";
                content += stringStringEntry.getValue();
            }

            FileUtil.save(content, DOC_CLASS_TARGET, true);


        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    private static boolean addClass(String className) {

        if (!className.equals("none")) {

            if (!DTO_MAP.containsKey(className)) {
                try {

                    Class aClass = Class.forName(DTO_PATH + className);
                    String json = convertClassToJson(aClass, 0);
                    DTO_MAP.put(className, json);
                    return true;
                } catch (Exception e) {
                    System.out.println("cannot found class " + DTO_PATH + className);
                }
            } else {
                return true;
            }
        }
        return false;
    }

    private static String createDoc(String httpRequstType, String route, String doc) throws ClassNotFoundException, JsonProcessingException {
        String r = "<h2>" + httpRequstType + " " + route + "</h2>";

        String desc = getValue(doc, DOC_DESC),
                dto = getValue(doc, DOC_DTO),
                result = getValue(doc, DOC_RESULT),
                exception = getValue(doc, DOC_EXCEPTION),
                security = getValue(doc, DOC_SECURITY);

        Map<String, String> params = getValues(doc, DOC_PARAM);

        r += "<table>";

        r += addLine("Description", desc.replace("*", "\n"));
        r += addLine("Security", security);
        if (addClass(dto)) {
            r += addLine("DTO expected", "<a href='class.html#" + dto + "'>" + getDTOName(dto) + "</a>");
        } else {
            r += addLine("DTO expected", dto);
        }

        for (Map.Entry<String, String> stringStringEntry : params.entrySet()) {
            r += addLine("Param " + stringStringEntry.getKey(), stringStringEntry.getValue());
        }

        if (addClass(result)) {
            r += addLine("Result / DTO returned", "<a href='class.html#" + result + "'>" + getDTOName(result) + "</a>");
        } else {
            r += addLine("Result / DTO returned", result);
        }

        r += addLine("Error possible", exception);


        r += "</table>";

        return r;
    }

    private static String addLine(String title, String content) {
        return "<tr><td>" + title + "</td><td>" + content + "</td></tr>";
    }


    private static String getValue(String s, Pattern pattern) {
        Matcher descMAtcher = pattern.matcher(s);
        if (descMAtcher.find()) {
            String r = descMAtcher.group(1);
            if (r.equals("")) {
                return "none";
            }
            return r.replace("\n", "<br/>");
        }
        return "none";
    }

    private static Map<String, String> getValues(String s, Pattern pattern) {
        Matcher descMAtcher = pattern.matcher(s);
        Map<String, String> rr = new HashMap<>();
        while (descMAtcher.find()) {
            String r = descMAtcher.group(2);
            if (!r.equals("")) {
                rr.put(descMAtcher.group(1), r);
            }
        }
        return rr;
    }

    /**
     * convert a class to String json in HTML
     *
     * @param clazz
     * @param lev
     * @return
     * @throws JsonProcessingException
     */
    private static String convertClassToJson(Class clazz, int lev) throws JsonProcessingException {

        String v = "{\n";

        List<Field> allFields = getAllFields(new ArrayList<>(), clazz);
        for (Field field : allFields) {
            String typeString = null;
            Class<?> type = field.getType();
            boolean isBasicField = true;
            if (type == String.class) {
                typeString = "Text";
            } else if (type == Double.class ||
                    type == Long.class) {
                typeString = "Number";
            } else if (type == Integer.class) {
                typeString = "Integer";
            } else if (type == Boolean.class) {
                typeString = "Boolean";
            } else if (type == Date.class) {
                typeString = "Date";
            } else if (DTO.class.isAssignableFrom(type)) {
                isBasicField = false;
                typeString = convertClassToJson(type, lev + 2);
            } else if (type.isEnum()) {
                typeString = "Enum[";
                for (Object o : type.getEnumConstants()) {
                    typeString += o.toString() + ",";
                }
                typeString += "]";
            } else if (type == List.class) {
                Class<?> persistentClass = (Class<?>) ((ParameterizedType) type.getGenericSuperclass()).getActualTypeArguments()[0];
                int i = 0;
            } else {
                System.out.println("CLASS not accepted : " + type.getName());
                continue;
            }


            if (isBasicField) {
                //is basic field
                v += getSpace(lev + 1) + getReject(lev) + "\"" + field.getName() + "\":</span><span class='class-field-type'>" + typeString + "</span>";

                //compute validation rules
                String validation = "";
                for (Annotation annotation : field.getDeclaredAnnotations()) {

                    if (annotation instanceof javax.validation.constraints.NotNull) {
                        validation += "Cannot be null;";
                    }
                    if (annotation instanceof javax.validation.constraints.Pattern) {
                        String regexp = ((javax.validation.constraints.Pattern) annotation).regexp();
                        validation += "Must respect the follow pattern : " + regexp + ";";
                    }
                    if (annotation instanceof javax.validation.constraints.Size) {
                        Integer min = ((javax.validation.constraints.Size) annotation).min();
                        Integer max = ((javax.validation.constraints.Size) annotation).max();
                        validation += "Must have a size between "+min+" and "+max+";";
                    }
                }
                if(validation.length()>0){
                    v += "<span class='class-validation'>"+validation+"</span>";
                }
                v+="\n";

            } else {
                //is an other dto
                v += getSpace(lev + 1) + "\"" + field.getName() + "\"" + typeString + getSpace(lev + 1) + "}\n";
            }
        }

        if (lev == 0) {
            v += getSpace(lev) + "}";
        }

        v = v.replaceAll("\n", "<br/>");

        return v;
    }

    /**
     * return a span element to add spacing after the name of the json field
     */
    private static String getReject(int lev) {

        int w = 200 - (lev * SPACING);

        return "<span class='class-spacer' style='width:" + w + "px;'>";
    }

    /**
     * return a span element to add a spacing before a string
     */
    private static String getSpace(int lev) {
        if (lev > 0) {
            int w = lev * SPACING;
            return "<span style='width:" + w + "px;display: inline-block;'></span>";
        }
        return "";
    }

    /**
     * return all fields of a DTO class, include fields of superClass, exclude field with JsonIgnoreProperties properties and fields contain __
     */
    public static List<Field> getAllFields(List<Field> fields, Class<?> type) {
        for (Field field : type.getDeclaredFields()) {

            boolean toAdd = true;

            if (field.getName().contains("__")) {
                toAdd = false;
            }
            for (Annotation annotation : field.getDeclaredAnnotations()) {
                if (annotation instanceof JsonIgnoreProperties) {
                    toAdd = false;
                }
            }
            if (toAdd) {
                fields.add(field);
            }
        }

        if (type.getSuperclass() != null) {
            fields = getAllFields(fields, type.getSuperclass());
        }

        return fields;
    }

    /**
     * return the name of the DTO, without the path
     */
    private static String getDTOName(String s) {
        String[] split = s.split("\\.");
        return split[split.length - 1];
    }
}
