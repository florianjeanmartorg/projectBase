package be.lynk.server.service.impl;


import be.lynk.server.service.VelocityGeneratorService;
import org.apache.commons.io.IOUtils;
import org.apache.velocity.VelocityContext;
import org.apache.velocity.app.VelocityEngine;
import org.springframework.stereotype.Repository;
import play.Logger;

import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.io.OutputStreamWriter;
import java.io.StringWriter;
import java.util.Iterator;
import java.util.Map;

@Repository
public class VelocityGeneratorServiceImpl implements VelocityGeneratorService {

    public String generate(String templateName, Map values) {

        InputStream in = getClass().getResourceAsStream("/vm/" + templateName);
        String velocityTemplate = new String("");

        try {
            velocityTemplate = IOUtils.toString(in, "UTF8");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return (velocityRender(velocityTemplate, values));
    }

    private String velocityRender(String template, Map values) {

        StringBuffer Html = new StringBuffer();

        VelocityEngine ve = new VelocityEngine();
        ve.init();

        VelocityContext context = new VelocityContext();

        Iterator it = values.entrySet().iterator();
        while (it.hasNext()) {
            Map.Entry entry = (Map.Entry) it.next();
            context.put(entry.getKey().toString(), entry.getValue());
        }

        ByteArrayOutputStream output = new ByteArrayOutputStream();
        OutputStreamWriter html = new OutputStreamWriter(output);

        StringWriter result = new StringWriter();
        try {
            if (!ve.evaluate(context, result, "report", template)) {
                Logger.info("Evaluation error");
            } else {
                Logger.info("Evaluation success");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        //Logger.info("Render result:" + result.toString());
        return (result.toString());

    }

}
