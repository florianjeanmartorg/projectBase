package be.lynk.server.service;

import be.lynk.server.model.entities.Account;
import be.lynk.server.model.entities.Session;

import java.util.List;

/**
 * Created by florian on 12/03/15.
 */
public interface SessionService extends CrudService<Session>{
    List<Session> findByAccount(Account currentUser);
}
