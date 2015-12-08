package be.lynk.server.model.entities;

import be.lynk.server.model.entities.technical.AbstractEntity;

import javax.persistence.*;

/**
 * Created by florian on 3/05/15.
 */
@Entity
public class FacebookCredential extends AbstractEntity {

    @OneToOne(optional = false, cascade = {CascadeType.PERSIST, CascadeType.MERGE}, fetch = FetchType.LAZY)
    private Account account;

    @Basic(optional = false)
    @Column(unique = true)
    private String userId;

    @Basic
    private String firstname;

    @Basic
    private String lastname;

    public FacebookCredential() {
    }

    public FacebookCredential(Account account, String userId) {
        this.account = account;
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

    public Account getAccount() {
        return account;
    }

    public void setAccount(Account account) {
        this.account = account;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    @Override
    public String toString() {
        return "FacebookCredential{" +
                ", userId='" + userId + '\'' +
                '}';
    }
}
