package be.lynk.server.controller.rest;

import be.lynk.server.controller.EmailController;
import be.lynk.server.dto.ContactFormDTO;
import be.lynk.server.util.exception.MyRuntimeException;
import be.lynk.server.util.message.ErrorMessageEnum;
import org.springframework.beans.factory.annotation.Autowired;
import play.db.jpa.Transactional;
import play.mvc.Result;

/**
 * Created by florian on 17/09/15.
 */
@org.springframework.stereotype.Controller
public class ContactRestController extends AbstractRestController {

    @Autowired
    private EmailController emailController;


    @Transactional
    public Result contact() {

        ContactFormDTO contactFormDTO = initialization(ContactFormDTO.class);

        String email;
        if (securityController.isAuthenticated(ctx())) {
            email = securityController.getCurrentUser().getEmail();
        } else if (contactFormDTO.getEmail() == null) {
            throw new MyRuntimeException(ErrorMessageEnum.ERROR_CONTACT_NO_EMAIL);
        } else {
            email = contactFormDTO.getEmail().toLowerCase();
        }

        emailController.sendContactEmail(contactFormDTO.getTarget(),
                                         email,
                                         contactFormDTO.getSubject(),
                                         contactFormDTO.getMessage());

        return ok();
    }

}
