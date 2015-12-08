package be.lynk.server.dto.externalDTO;

import be.lynk.server.dto.technical.DTO;

/**
 * Created by florian on 3/05/15.
 */
public class FacebookTokenAccessControlDTO extends DTO {

    private String id;
    private String email;
    private String first_name;
    private String gender;
    private String last_name;
    private String locale;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getFirst_name() {
        return first_name;
    }

    public void setFirst_name(String first_name) {
        this.first_name = first_name;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getLast_name() {
        return last_name;
    }

    public void setLast_name(String last_name) {
        this.last_name = last_name;
    }

    public String getLocale() {
        return locale;
    }

    public void setLocale(String locale) {
        this.locale = locale;
    }

    @Override
    public String toString() {
        return "FacebookTokenAccessControlDTO{" +
                "id='" + id + '\'' +
                ", email='" + email + '\'' +
                ", first_name='" + first_name + '\'' +
                ", gender='" + gender + '\'' +
                ", last_name='" + last_name + '\'' +
                ", locale='" + locale + '\'' +
                "} " + super.toString();
    }
}
