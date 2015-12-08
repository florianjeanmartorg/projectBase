package be.lynk.server.service;

import be.lynk.server.dto.externalDTO.FacebookTokenAccessControlDTO;
import be.lynk.server.model.entities.FacebookCredential;

/**
 * Created by florian on 3/05/15.
 */
public interface FacebookCredentialService extends CrudService<FacebookCredential> {
    FacebookCredential findByUserId(String userId);

    FacebookTokenAccessControlDTO controlFacebookAccess(String accessToken);

    FacebookTokenAccessControlDTO controlFacebookAccess(String accessToken, String expectedId);
}
