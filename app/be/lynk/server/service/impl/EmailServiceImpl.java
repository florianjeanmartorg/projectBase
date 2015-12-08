package be.lynk.server.service.impl;

import be.lynk.server.model.email.EmailMessage;
import be.lynk.server.model.email.MailConfig;
import be.lynk.server.service.EmailSenderService;
import be.lynk.server.service.EmailService;
import be.lynk.server.service.TranslationService;
import be.lynk.server.service.VelocityGeneratorService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import play.i18n.Lang;

import java.util.HashMap;
import java.util.Map;

/**
 * Created by florian on 31/03/15.
 */
@Service
public class EmailServiceImpl implements EmailService {

    @Autowired
    private EmailSenderService emailSenderService;

    @Autowired
    private VelocityGeneratorService velocityGeneratorService;

    @Autowired
    private TranslationService translationService;

    @Autowired
    private MailConfig emailProperties;

    @Override
    public void sendEmail(EmailMessage emailMessage, Lang lang) {
        try {

            Map<String, Object> values = new HashMap<>();
            values.put("projectName", translationService.getTranslation("--.site.name", lang));
            values.put("projectUrl", emailProperties.getUrl());
            emailMessage.setSubject(emailMessage.getSubject());
            emailMessage.setContent(emailMessage.getContent());
            values.put("content", emailMessage.getContent());

            //use the default email template
            String content = velocityGeneratorService.generate("basicEmailStructure.vm", values);
            emailMessage.setContent(content);


            emailSenderService.send(emailMessage);
        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException(e);
        }
    }
}