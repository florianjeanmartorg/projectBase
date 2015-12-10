package be.lynk.server.dto.post;

import be.lynk.server.dto.LangDTO;
import be.lynk.server.dto.technical.DTO;
import be.lynk.server.model.GenderEnum;
import be.lynk.server.util.constants.ValidationRegex;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;


/**
 * Created by florian on 11/11/14.
 */
public class AccountRegistrationDTO extends DTO  {

    @NotNull
    private GenderEnum gender;

    @NotNull
    @Pattern(regexp = "^.{2,50}$", message = "--.validation.dto.size")
    private String firstname;

    @NotNull
    @Pattern(regexp = "^.{2,50}$", message = "--.validation.dto.size")
    private String lastname;

    @NotNull
    @Pattern(regexp = ValidationRegex.EMAIL, message = "validation.dto.email")
    private String email;

    @NotNull
    @Pattern(regexp = "^[a-zA-Z0-9-_]{6,18}$", message = "--.validation.dto.password")
    private String password;

    private LangDTO lang;

    public GenderEnum getGender() {
        return gender;
    }

    public void setGender(GenderEnum gender) {
        this.gender = gender;
    }

    public String getFirstname() {
        return firstname;
    }

    public void setFirstname(String firstname) {
        this.firstname = firstname;
    }

    public String getLastname() {
        return lastname;
    }

    public void setLastname(String lastname) {
        this.lastname = lastname;
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

    public LangDTO getLang() {
        return lang;
    }

    public void setLang(LangDTO lang) {
        this.lang = lang;
    }

    @Override
    public String toString() {
        return "AccountRegistrationDTO{" +
                "gender=" + gender +
                ", firstname='" + firstname + '\'' +
                ", lastname='" + lastname + '\'' +
                ", email='" + email + '\'' +
                ", password='" + password + '\'' +
                ", lang=" + lang +
                '}';
    }
}
