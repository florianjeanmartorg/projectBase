package be.lynk.server.service;

import be.lynk.server.model.email.EmailMessage;
import play.i18n.Lang;

/**
 * Created by florian on 23/05/15.
 */
public interface EmailService {

    void sendEmail(EmailMessage emailMessage, Lang lang);
}
