package be.lynk.server.service;

import be.lynk.server.model.entities.LoginCredential;

/**
 * Created by florian on 3/05/15.
 */
public interface LoginCredentialService extends CrudService<LoginCredential>{
    boolean controlPassword(String password, LoginCredential loginCredential);
}
