package be.lynk.server.dto;

import be.lynk.server.controller.technical.security.role.RoleEnum;
import be.lynk.server.dto.technical.DTO;
import be.lynk.server.model.GenderEnum;
import be.lynk.server.util.constants.ValidationRegex;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

/**
 * Created by florian on 11/11/14.
 */
public class AccountDTO extends DTO  {

    private Long id;

    @NotNull(message = "--.validation.dto.notNull")
    protected GenderEnum gender;

    @NotNull(message = "--.validation.dto.notNull")
    @Size(min = 2, max = 50, message = "--.validation.dto.size")
    private String firstname;

    @NotNull(message = "--.validation.dto.notNull")
    @Size(min = 2, max = 50, message = "--.validation.dto.size")
    private String lastname;

    @NotNull(message = "--.validation.dto.notNull")
    @Pattern(regexp = ValidationRegex.EMAIL, message = "--.validation.dto.email")
    private String email;

    private RoleEnum role;

    private LangDTO lang;

    public AccountDTO() {
    }

    public GenderEnum getGender() {
        return gender;
    }

    public void setGender(GenderEnum gender) {
        this.gender = gender;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
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

    public RoleEnum getRole() {
        return role;
    }

    public void setRole(RoleEnum role) {
        this.role = role;
    }

    public LangDTO getLang() {
        return lang;
    }

    public void setLang(LangDTO lang) {
        this.lang = lang;
    }

    @Override
    public String toString() {
        return "AccountDTO{" +
                "id=" + id +
                ", gender=" + gender +
                ", firstname='" + firstname + '\'' +
                ", lastname='" + lastname + '\'' +
                ", email='" + email + '\'' +
                ", role=" + role +
                ", lang=" + lang +
                '}';
    }
}
