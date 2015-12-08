package be.lynk.server.service.impl;

import be.lynk.server.controller.technical.security.role.RoleEnum;
import be.lynk.server.model.entities.Account;
import be.lynk.server.model.entities.FacebookCredential;
import be.lynk.server.service.AccountService;
import org.jasypt.util.password.StrongPasswordEncryptor;
import org.springframework.stereotype.Repository;
import play.db.jpa.JPA;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import java.util.List;

/**
 * Created by florian on 10/11/14.
 */
@Repository
public class AccountServiceImpl extends CrudServiceImpl<Account> implements AccountService {

    @Override
    public void saveOrUpdate(Account entity) {
        entity.setEmail(entity.getEmail().toLowerCase());
        super.saveOrUpdate(entity);
    }


    @Override
    public Account findByEmail(String email) {

        CriteriaBuilder cb = JPA.em().getCriteriaBuilder();
        CriteriaQuery<Account> cq = cb.createQuery(Account.class);
        Root<Account> from = cq.from(Account.class);
        cq.select(from);
        cq.where(cb.equal(from.get("email"), email.toLowerCase()));
        Account singleResultOrNull = getSingleResultOrNull(cq);
        return singleResultOrNull;

    }

    @Override
    public Account findByAuthenticationKey(String authenticationKey) {
        CriteriaBuilder cb = JPA.em().getCriteriaBuilder();
        CriteriaQuery<Account> cq = cb.createQuery(Account.class);
        Root<Account> from = cq.from(Account.class);
        cq.select(from);
        cq.where(cb.equal(from.get("authenticationKey"), authenticationKey));
        return getSingleResultOrNull(cq);
    }

    @Override
    public boolean controlAuthenticationKey(String authenticationKey, Account account) {
        return account.getAuthenticationKey() != null && !(account.getAuthenticationKey().length() < 40) && new StrongPasswordEncryptor().checkPassword(authenticationKey, account.getAuthenticationKey());
    }

    @Override
    public Integer getCount() {
        return findAll().size();
    }

    @Override
    public Account findByFacebook(FacebookCredential facebookCredential) {

        String r = "SELECT a FROM Account a where a.facebookCredential=:facebookCredential";

        return JPA.em().createQuery(r, Account.class)
                .setParameter("facebookCredential", facebookCredential)
                .getSingleResult();

    }


    @Override
    public List<Account> findByRole(RoleEnum role) {

        CriteriaBuilder cb = JPA.em().getCriteriaBuilder();
        CriteriaQuery<Account> cq = cb.createQuery(Account.class);
        Root<Account> from = cq.from(Account.class);
        cq.select(from);


        cq.where(cb.equal(from.get("role"), role));

        return JPA.em().createQuery(cq).getResultList();
    }


}
