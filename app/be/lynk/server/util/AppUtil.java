package be.lynk.server.util;

import play.Configuration;

/**
 * Created by florian on 10/05/15.
 */
public class AppUtil {

    static String appId = Configuration.root().getString("facebook.app.id");
    static String appSecret = Configuration.root().getString("facebook.app.secret");

    public static String getFacebookAppId(){
        if(appId!=null){
            return appId;
        }
        //id of lynk dev
        return "1047308001965929";

    }

    public static String getFacebookAppSecret() {
        return appSecret;
    }
}
