package be.lynk.server.model.entities;

import be.lynk.server.model.entities.technical.AbstractEntity;
import be.lynk.server.util.Encrypter;

import javax.persistence.*;

/**
 * Created by florian on 3/05/15.
 */
@Entity
public class LoginCredential  extends AbstractEntity {

    @OneToOne(optional = false,cascade = {CascadeType.PERSIST,CascadeType.MERGE},fetch = FetchType.LAZY)
    private Account account;

    @Basic(optional =  false)
    private String password;

    @PrePersist
    @PreUpdate
    public void encryptPassword(){
        //generate the password
        if (password.length() < 50) {
            password = Encrypter.generateEncryptingPassword(password);
        }
    }

    public LoginCredential() {
    }

    public LoginCredential(Account account, String password) {
        this.account = account;
        this.password = password;
    }

    public Account getAccount() {
        return account;
    }

    public void setAccount(Account account) {
        this.account = account;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    @Override
    public String toString() {
        return "LoginCredential{" +
                ", password='" + password + '\'' +
                '}';
    }

}
