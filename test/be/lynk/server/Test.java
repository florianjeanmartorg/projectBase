package be.lynk.server;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Created by florian on 19/07/15.
 */
public class Test {


    @org.junit.Test
    public void test(){

        String s[] = {"aa:bb","a|b|c:d","ccc"};


        Pattern pattern = Pattern.compile("^(([^:]*):)?([^:]*)$");
        Pattern pattern2 = Pattern.compile("([a-z]+)(\\||$)");

        for(int i=0;i<s.length;i++){
            Matcher matcher = pattern.matcher(s[i]);

            while (matcher.find()){
                System.out.println("*************");

                System.out.println("-2:"+matcher.group(2));

                if(matcher.group(2)!=null){
                    Matcher matcher1 = pattern2.matcher(matcher.group(2));
                    while (matcher1.find()){
                        System.out.println("--:"+matcher1.group(1));
                    }
                }

                System.out.println("-3:"+matcher.group(3));
            }
        }




    }
}
