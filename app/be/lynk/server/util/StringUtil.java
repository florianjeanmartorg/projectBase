package be.lynk.server.util;

import java.text.DecimalFormat;
import java.text.Normalizer;

/**
 * Created by florian on 18/11/14.
 * Some function for string
 */
public class StringUtil {

    public static String toFirstLetterUpper(String s) {
        return Character.toUpperCase(s.charAt(0)) + s.substring(1);
    }

    public static String toDouble(Double value) {
        DecimalFormat df = new DecimalFormat("0.00");
        return df.format(value);

    }

    public static String normalize(String s) {
        return Normalizer.normalize(s, Normalizer.Form.NFD)
                         .replaceAll("[^\\p{ASCII}]", "")
                         .toLowerCase()
                         .replaceAll("( |-)", "_")
                         .replaceAll("('|&|/|\")", "");
    }


}
