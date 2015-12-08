package be.lynk.server.service.impl;

import be.lynk.server.model.email.EmailMessage;
import be.lynk.server.model.email.MailConfig;
import be.lynk.server.service.EmailSenderService;
import com.microtripit.mandrillapp.lutung.MandrillApi;
import com.microtripit.mandrillapp.lutung.model.MandrillApiError;
import com.microtripit.mandrillapp.lutung.view.MandrillMessage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import play.Configuration;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

/**
 * Created by florian on 13/05/15.
 */
@Service
public class MandrillSenderServiceImpl implements EmailSenderService {

    private final static String MANDRILL_KEY_TOKEN = Configuration.root().getString("mandrill.key");


    @Autowired
    private MailConfig emailProperties;


    @Override
    public void send(EmailMessage emailMessage) {

        MandrillApi mandrillApi = new MandrillApi(MANDRILL_KEY_TOKEN);

        //convert emailMessage to
        MandrillMessage message = new MandrillMessage();
        message.setHeaders(new HashMap<>());

        //from
        message.setFromEmail(emailProperties.getFrom());
        message.setFromName(emailProperties.getFrom());
        if (emailMessage.getReplyTo() != null) {
            message.getHeaders().put("Reply-To", emailMessage.getReplyTo());
        }
        //recipients
        ArrayList<MandrillMessage.Recipient> recipients = new ArrayList<>();
        message.setTo(recipients);
        for (EmailMessage.Recipient s : emailMessage.getRecipients()) {

            MandrillMessage.Recipient recipient = new MandrillMessage.Recipient();

            recipient.setEmail(s.getEmail());
            recipient.setName(s.getName());
            switch (s.getType()) {
                case TO:
                    recipient.setType(MandrillMessage.Recipient.Type.TO);
                    break;
                case BCC:
                    recipient.setType(MandrillMessage.Recipient.Type.BCC);
                    break;
                case CC:
                    recipient.setType(MandrillMessage.Recipient.Type.CC);
                    break;
            }

            recipients.add(recipient);

        }
        message.setPreserveRecipients(true);


        //subject
        message.setSubject(emailMessage.getSubject());
        //content
        message.setHtml(emailMessage.getContent());
        message.setAutoText(true);

        //send
        try {
            mandrillApi.messages().send(message, true);
        } catch (MandrillApiError mandrillApiError) {
            mandrillApiError.printStackTrace();
            throw new RuntimeException(mandrillApiError);
        } catch (IOException e) {
            e.printStackTrace();
            throw new RuntimeException(e);
        }

    }
}
