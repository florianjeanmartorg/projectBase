package be.lynk.server.util.tool;

public class ColorGenerator {

    public static Float getColorWeb(int no) {

        if (no >= 5) {
            //double a = new Double(no)/5.0;
            int a = no / 5;
            int b = no - (a * 5);
            return 60F * b + 10 * a;
        }
        return 60F * no;

    }

}