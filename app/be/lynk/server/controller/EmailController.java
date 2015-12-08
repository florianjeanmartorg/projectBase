package be.lynk.server.controller;

import be.lynk.server.controller.technical.AbstractController;
import be.lynk.server.model.email.EmailMessage;
import be.lynk.server.model.entities.Account;
import be.lynk.server.service.EmailService;
import be.lynk.server.service.TranslationService;
import be.lynk.server.util.ContactTargetEnum;
import be.lynk.server.util.message.EmailMessageEnum;
import org.springframework.beans.factory.annotation.Autowired;
import play.db.jpa.Transactional;
import play.i18n.Lang;

/**
 * Created by florian on 6/12/14.
 */
@org.springframework.stereotype.Controller
public class EmailController extends AbstractController {

    //service
    @Autowired
    private EmailService       emailService;
    @Autowired
    private TranslationService translationService;

    @Transactional
    public void sendApplicationRegistrationBusinessEmail(Account account) {

        String title = translationService.getTranslation(
                EmailMessageEnum.REGISTRATION_BUSINESS_SUBJECT,
                account.getLang());

        String body = translationService.getTranslation(
                EmailMessageEnum.REGISTRATION_BUSINESS_BODY,
                account.getLang(),
                account.getFirstname() + " " + account.getLastname());

        EmailMessage.Recipient recipient = new EmailMessage.Recipient(account.getEmail(), account.getFirstname() + " " + account.getLastname());
        EmailMessage emailMessage = new EmailMessage(recipient, title, body);

        emailService.sendEmail(emailMessage, account.getLang());
    }

    @Transactional
    public void sendApplicationRegistrationCustomerEmail(Account account) {

        String title = translationService.getTranslation(
                EmailMessageEnum.REGISTRATION_CUSTOMER_SUBJECT,
                account.getLang());

        String body = translationService.getTranslation(
                EmailMessageEnum.REGISTRATION_CUSTOMER_BODY,
                account.getLang(),
                account.getFirstname() + " " + account.getLastname());

        EmailMessage.Recipient recipient = new EmailMessage.Recipient(account.getEmail(), account.getFirstname() + " " + account.getLastname());
        EmailMessage emailMessage = new EmailMessage(recipient, title, body);

        emailService.sendEmail(emailMessage, account.getLang());
    }

    @Transactional
    public void sendNewPasswordEmail(Account account) {

        String title = translationService.getTranslation(
                EmailMessageEnum.FORGOT_PASSWORD_SUBJECT,
                account.getLang());

        String body = translationService.getTranslation(
                EmailMessageEnum.FORGOT_PASSWORD_BODY,
                account.getLang(),
                account.getFirstname() + " " + account.getLastname(),
                account.getLoginCredential().getPassword());

        EmailMessage.Recipient recipient = new EmailMessage.Recipient(account.getEmail(), account.getFirstname() + " " + account.getLastname());
        EmailMessage emailMessage = new EmailMessage(recipient, title, body);

        emailService.sendEmail(emailMessage, account.getLang());
    }

    @Transactional
    public void sendContactEmail(ContactTargetEnum target, String email, String subject, String message) {

        String title = "Gling : message de " + target.getType();

        String body =
                "De : " + email + "<br/><br/>" +
                        "Suject : " + subject + "<br/><br/>" +
                        "Message : " + message + "<br/><br/>";

        EmailMessage.Recipient recipient = new EmailMessage.Recipient(target.getEmail());
        EmailMessage emailMessage = new EmailMessage(recipient, title, body);

        emailService.sendEmail(emailMessage, Lang.forCode("fr"));
    }
}
