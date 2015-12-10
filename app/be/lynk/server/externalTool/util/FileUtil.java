package be.lynk.server.externalTool.util;

import java.io.*;

/**
 * Created by florian on 13/05/15.
 */
public class FileUtil {

    public static final String RETURN_REGEX = "\n";

    public static String getString(File file) throws Exception {
        BufferedReader br = new BufferedReader(new FileReader(file));
        try {
            StringBuilder sb = new StringBuilder();
            String line = br.readLine();

            while (line != null) {
                sb.append(line);
                sb.append(System.lineSeparator());
                line = br.readLine();
            }
            return sb.toString();
        } finally {
            br.close();
        }
    }

    public static String[] getStringByLine(File file) throws Exception {
        String string = getString(file);
        return string.split(RETURN_REGEX);
    }

    public static void save(final String content, final String path, boolean erase) {

        final File file = new File(path);

        if (!file.exists() || erase == true) {

            if (!file.getParentFile().exists()) {
                file.getParentFile().mkdirs();
            }
            try {
                file.createNewFile();
                System.out.println("saved !");
            } catch (final IOException e) {
                System.out.println("file no created");
            }

            file.setWritable(true);
            file.setReadable(true);
            try {
                //final PrintWriter out = new PrintWriter(new FileWriter(nameFile), true);
                Writer out = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(path), "UTF-8"));

                out.write(content);

                out.close();
            } catch (final Exception e) {
                e.printStackTrace();
            }
        } else
            System.out.println("file already exist and can't be erase");

    }


}
