package be.lynk.server.service.impl;

import be.lynk.server.dto.externalDTO.FacebookTokenAccessControlDTO;
import be.lynk.server.model.entities.FacebookCredential;
import be.lynk.server.service.FacebookCredentialService;
import be.lynk.server.util.exception.MyRuntimeException;
import be.lynk.server.util.httpRequest.FacebookRequest;
import be.lynk.server.util.message.ErrorMessageEnum;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import play.db.jpa.JPA;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;

/**
 * Created by florian on 3/05/15.
 */
@Repository
public class FacebookCredentialServiceImpl extends CrudServiceImpl<FacebookCredential> implements FacebookCredentialService {

    @Autowired
    private FacebookRequest facebookRequest;

    @Override
    public FacebookCredential findByUserId(String userId) {

        CriteriaBuilder cb = JPA.em().getCriteriaBuilder();
        CriteriaQuery<FacebookCredential> cq = cb.createQuery(FacebookCredential.class);
        Root<FacebookCredential> from = cq.from(FacebookCredential.class);
        cq.select(from);
        cq.where(cb.equal(from.get("userId"), userId));
        return getSingleResultOrNull(cq);
    }

    @Override
    public FacebookTokenAccessControlDTO controlFacebookAccess(String accessToken, String expectedId) {

        FacebookTokenAccessControlDTO facebookTokenAccessControlDTO = facebookRequest.meRequest(accessToken);

        if (!facebookTokenAccessControlDTO.getId().equals(expectedId)) {
            throw new MyRuntimeException(ErrorMessageEnum.FACEBOOK_AUTHENTICATION_FAIL);
        }

        return facebookTokenAccessControlDTO;
    }

}
