package be.lynk.server.dto.post;

import be.lynk.server.dto.technical.DTO;
import be.lynk.server.util.constants.ValidationRegex;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;


/**
 * Created by florian on 10/11/14.
 */
public class LoginDTO extends DTO  {

    @NotNull(message = "--.validation.dto.notNull")
    @Pattern(regexp = ValidationRegex.EMAIL,message = "--.validation.dto.email")
    private String email;

    @NotNull(message = "--.validation.dto.notNull")
    @Pattern(regexp = ValidationRegex.PASSWORD,message = "--.validation.dto.password")
    private String password;

    public LoginDTO() {
    }

    public LoginDTO(String email, String password) {
        this.email = email;
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    @Override
    public String toString() {
        return "LoginDTO{" +
                "email='" + email + '\'' +
                ", password='" + password + '\'' +
                '}';
    }
}
