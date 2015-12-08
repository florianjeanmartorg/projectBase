package be.lynk.server.util.httpRequest;

import be.lynk.server.dto.technical.DTO;
import com.fasterxml.jackson.core.JsonFactory;
import com.fasterxml.jackson.core.JsonParser;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import play.Logger;

import java.io.*;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by florian on 30/08/14.
 */
public class HttpRequest {

    private final RequestMethod requestMethod;
    private       String        urlString;
    private Map<String, String> params = null;
    private Map<String, String> header = null;
    private DTO dto;
    private Class returnExcepted = null;

    public HttpRequest(RequestMethod requestMethod, String urlString) {
        this.requestMethod = requestMethod;
        this.urlString = urlString;
    }

    public void setParams(Map<String, String> params) {
        this.params = params;
    }

    public void setHeader(Map<String, String> header) {
        this.header = header;
    }

    public void setDto(DTO dto) {
        this.dto = dto;
    }

    public void setReturnExcepted(Class returnExcepted) {
        this.returnExcepted = returnExcepted;
    }

    public enum RequestMethod {
        GET, POST
    }

    public Object sendRequest() throws HttpRequestException {

        if (params == null) {
            params = new HashMap<>();
        }

        String paramString = buildOption(params);

        try {

            if (!urlString.contains("http")) {
                urlString = "http://" + urlString;
            }

            if (requestMethod.equals(RequestMethod.GET)) {
                urlString = urlString + "?" + buildOption(params);
            }

            URL url = new URL(urlString);

            Logger.info("EXTERNAL REQUEST URL : "+urlString);

            HttpURLConnection connection = (HttpURLConnection) url.openConnection();

            //add header
            if (header != null) {
                for (Map.Entry<String, String> entry : header.entrySet()) {
                    connection.setRequestProperty(entry.getKey(), entry.getValue());
                }
            }
            connection.setRequestMethod(requestMethod.toString());
            connection.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");
            connection.setRequestProperty("Content-Language", "en-US");
            connection.setUseCaches(false);
            connection.setDoInput(true);
            connection.setDoOutput(true);


            if (requestMethod.equals(RequestMethod.POST)) {
                connection.setRequestProperty("Content-Length", "" +
                        Integer.toString(paramString.getBytes().length));

                //add Dto
                if (dto != null) {
                    connection.setRequestProperty("Content-Type", "application/json");

                    GsonBuilder gsonBuilder = new GsonBuilder();
                    Gson gson = gsonBuilder.create();
                    String json = gson.toJson(dto);
                    OutputStream os = connection.getOutputStream();
                    os.write(json.getBytes("UTF-8"));
                    os.close();
                }

            }


            //Send request
            if (requestMethod.equals(RequestMethod.POST)) {
                DataOutputStream wr = new DataOutputStream(
                        connection.getOutputStream());
                wr.writeBytes(paramString);
                wr.flush();
                wr.close();
            }

            //Get Response
            InputStream is = connection.getInputStream();
            BufferedReader rd = new BufferedReader(new InputStreamReader(is));
            String line;
            StringBuffer response = new StringBuffer();
            while ((line = rd.readLine()) != null) {
                response.append(line);
                response.append('\r');
            }
            rd.close();

            String responseS = response.toString();

            if (returnExcepted != null) {
                ObjectMapper mapper = new ObjectMapper();
                JsonFactory factory = mapper.getFactory();
                JsonParser jp = factory.createParser(responseS);
                JsonNode actualObj = mapper.readTree(jp);

                return DTO.getDTO(actualObj, returnExcepted);
            }
            return responseS;


        } catch (MalformedURLException e) {
            throw new HttpRequestException(e, "URL malformed");
        } catch (IOException e) {
            throw new HttpRequestException(e, "URL error");
        }


    }

    private String buildOption(Map<String, String> params) {
        if (params == null) {
            return "";
        }

        String content = "";
        boolean first = false;
        for (Map.Entry<String, String> entry : params.entrySet()) {
            if (first) {
                first = false;
            } else {
                content += "&";
            }
            content += entry.getKey() + "=" + entry.getValue();
        }
        return content;
    }
}
