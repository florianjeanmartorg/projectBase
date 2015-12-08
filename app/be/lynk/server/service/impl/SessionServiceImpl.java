package be.lynk.server.service.impl;

import be.lynk.server.model.entities.Account;
import be.lynk.server.model.entities.Session;
import be.lynk.server.service.SessionService;
import org.springframework.stereotype.Component;
import play.db.jpa.JPA;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import java.util.List;

/**
 * Created by florian on 12/03/15.
 */
@Component
public class SessionServiceImpl extends CrudServiceImpl<Session> implements SessionService {
    @Override
    public List<Session> findByAccount(Account account) {
        CriteriaBuilder cb = JPA.em().getCriteriaBuilder();
        CriteriaQuery<Session> cq = cb.createQuery(Session.class);
        Root<Session> from = cq.from(Session.class);
        cq.select(from);
        cq.where(cb.equal(from.get("account"), account));
        return JPA.em().createQuery(cq).getResultList();
        
    }
}
