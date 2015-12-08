package be.lynk.server.dto;


/**
 * Created by florian on 11/11/14.
 */
public class MyselfDTO extends AccountDTO {

    private Boolean loginAccount;

    private Boolean facebookAccount;

    private FacebookCredentialDTO facebookCredential;

    private String authenticationKey;

    public MyselfDTO() {
    }

    public FacebookCredentialDTO getFacebookCredential() {
        return facebookCredential;
    }

    public void setFacebookCredential(FacebookCredentialDTO facebookCredential) {
        this.facebookCredential = facebookCredential;
    }

    public String getAuthenticationKey() {
        return authenticationKey;
    }

    public void setAuthenticationKey(String authenticationKey) {
        this.authenticationKey = authenticationKey;
    }

    public Boolean getLoginAccount() {
        return loginAccount;
    }

    public void setLoginAccount(Boolean loginAccount) {
        this.loginAccount = loginAccount;
    }

    public Boolean getFacebookAccount() {
        return facebookAccount;
    }

    public void setFacebookAccount(Boolean facebookAccount) {
        this.facebookAccount = facebookAccount;
    }
}
