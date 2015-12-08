/*
 *
 * Instant Play Framework
 * EasyChat
 *                       
 *
 * Copyright (c) 2013/2014 RIMSHOT ITS SPRL.
 * Author Gaston Hollands
 *
 */

package be.lynk.server.model.email;

import org.springframework.stereotype.Component;

import javax.annotation.PostConstruct;
import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

@Component
final public class MailConfig {

    private String url;
    private String from;

    @PostConstruct
    public void initialize() {
        InputStream template = getClass().getResourceAsStream("/email/email.properties");

        Properties properties = new Properties();
        try {
            properties.load(template);
        } catch (IOException e) {
            e.printStackTrace();
        }

        url= properties.getProperty("url");
        from= properties.getProperty("from");
    }

    public String getUrl() {
        return url;
    }

    public String getFrom() {
        return from;
    }
}
