package be.lynk.server.dto;

import be.lynk.server.dto.technical.DTO;
import be.lynk.server.util.constants.ValidationRegex;

import javax.validation.constraints.Pattern;

/**
 * Created by florian on 27/12/14.
 */
public class ChangeEmailDTO extends DTO  {

    @Pattern(regexp = ValidationRegex.PASSWORD,message = "--.validation.dto.password")
    private String oldPassword;

    @Pattern(regexp = ValidationRegex.EMAIL,message = "--.validation.dto.email")
    private String newEmail;

    public ChangeEmailDTO() {
    }

    public String getOldPassword() {
        return oldPassword;
    }

    public void setOldPassword(String oldPassword) {
        this.oldPassword = oldPassword;
    }

    public String getNewEmail() {
        return newEmail;
    }

    public void setNewEmail(String newEmail) {
        this.newEmail = newEmail;
    }

    @Override
    public String toString() {
        return "ChangeEmailDTO{" +
                "oldPassword='" + oldPassword + '\'' +
                ", newEmail='" + newEmail + '\'' +
                '}';
    }
}
