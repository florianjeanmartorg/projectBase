package be.lynk.server.service.impl;

import be.lynk.server.model.entities.StoredFile;
import be.lynk.server.service.StoredFileService;
import org.springframework.stereotype.Repository;
import play.db.jpa.JPA;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;

@Repository
public class StoredFileServiceImpl extends CrudServiceImpl<StoredFile> implements StoredFileService {

    @Override
    public StoredFile findByStoredName(String storedName) {

        CriteriaBuilder cb = JPA.em().getCriteriaBuilder();
        CriteriaQuery<StoredFile> cq = cb.createQuery(StoredFile.class);
        Root<StoredFile> from = cq.from(StoredFile.class);
        cq.select(from);
        cq.where(cb.equal(from.get("storedName"), storedName));
        StoredFile singleResultOrNull = getSingleResultOrNull(cq);
        return singleResultOrNull;
    }
}
