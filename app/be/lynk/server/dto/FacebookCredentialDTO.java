package be.lynk.server.dto;

import be.lynk.server.dto.technical.DTO;

/**
 * Created by florian on 18/11/15.
 */
public class FacebookCredentialDTO extends DTO {

    private String userId;

    private String firstname;

    private String lastname;

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
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
}
