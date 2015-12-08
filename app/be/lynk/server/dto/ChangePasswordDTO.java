package be.lynk.server.dto;

import be.lynk.server.dto.technical.DTO;
import be.lynk.server.util.constants.ValidationRegex;

import javax.validation.constraints.Pattern;

/**
 * Created by florian on 27/12/14.
 */
public class ChangePasswordDTO extends DTO  {

    @Pattern(regexp = ValidationRegex.PASSWORD,message = "--.validation.dto.password")
    private String oldPassword;

    @Pattern(regexp = ValidationRegex.PASSWORD,message = "--.validation.dto.password")
    private String newPassword;

    public ChangePasswordDTO() {
    }

    public String getOldPassword() {
        return oldPassword;
    }

    public void setOldPassword(String oldPassword) {
        this.oldPassword = oldPassword;
    }

    public String getNewPassword() {
        return newPassword;
    }

    public void setNewPassword(String newPassword) {
        this.newPassword = newPassword;
    }

    @Override
    public String toString() {
        return "ChangePasswordDTO{" +
                "oldPassword='" + oldPassword + '\'' +
                ", newPassword='" + newPassword + '\'' +
                '}';
    }
}
