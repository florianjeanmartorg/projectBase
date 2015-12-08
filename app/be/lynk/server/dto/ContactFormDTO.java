package be.lynk.server.dto;

import be.lynk.server.dto.technical.DTO;
import be.lynk.server.util.ContactTargetEnum;

import javax.validation.constraints.NotNull;

/**
 * Created by florian on 17/09/15.
 */
public class ContactFormDTO extends DTO  {

    @NotNull
    private ContactTargetEnum target;

    private String email;

    @NotNull
    private String subject;
    @NotNull
    private String message;

    public ContactTargetEnum getTarget() {
        return target;
    }

    public void setTarget(ContactTargetEnum target) {
        this.target = target;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getSubject() {
        return subject;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }
}
