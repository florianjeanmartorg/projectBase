package be.lynk.server.dto;

import be.lynk.server.dto.technical.DTO;

import javax.validation.constraints.NotNull;

/**
 * Created by florian on 3/05/15.
 */
public class FacebookAuthenticationDTO extends DTO  {

    private String userId;

    @NotNull(message = "--.validation.dto.notNull")
    private String token;

    private LangDTO lang;

    public FacebookAuthenticationDTO() {
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getToken() {
        return token;
    }

    public void setToken(String token) {
        this.token = token;
    }

    @Override
    public String toString() {
        return "FacebookAuthenticationDTO{" +
                "userId=" + userId +
                ", token='" + token + '\'' +
                '}';
    }

    public LangDTO getLang() {
        return lang;
    }

    public void setLang(LangDTO lang) {
        this.lang = lang;
    }
}
