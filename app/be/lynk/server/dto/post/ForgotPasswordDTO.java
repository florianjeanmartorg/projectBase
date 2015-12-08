package be.lynk.server.dto.post;

import be.lynk.server.dto.technical.DTO;
import be.lynk.server.util.constants.ValidationRegex;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;

/**
 * Created by florian on 4/03/15.
 */
public class ForgotPasswordDTO extends DTO  {

    @NotNull(message = "--.validation.dto.notNull")
    @Pattern(regexp = ValidationRegex.EMAIL,message = "--.validation.dto.email")
    private String email;

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    @Override
    public String toString() {
        return "ForgotPasswordDTO{" +
                "email='" + email + '\'' +
                '}';
    }
}
