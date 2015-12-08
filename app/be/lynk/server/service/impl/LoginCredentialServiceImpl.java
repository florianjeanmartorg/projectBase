package be.lynk.server.service.impl;

import be.lynk.server.model.entities.LoginCredential;
import be.lynk.server.service.LoginCredentialService;
import org.jasypt.util.password.StrongPasswordEncryptor;
import org.springframework.stereotype.Repository;

/**
 * Created by florian on 3/05/15.
 */
@Repository
public class LoginCredentialServiceImpl extends CrudServiceImpl<LoginCredential> implements LoginCredentialService {

    @Override
    public boolean controlPassword(String password, LoginCredential loginCredential) {
        return new StrongPasswordEncryptor().checkPassword(password,
                loginCredential.getPassword());
    }

}
