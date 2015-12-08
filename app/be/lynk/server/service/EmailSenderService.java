package be.lynk.server.service;

import be.lynk.server.model.email.EmailMessage;

/**
 * Created by florian on 13/05/15.
 */
public interface EmailSenderService {

    void send(EmailMessage emailMessage);
}
