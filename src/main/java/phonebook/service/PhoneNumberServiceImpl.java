package phonebook.service;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import phonebook.entity.PhoneNumber;
import phonebook.entity.User;
import javax.persistence.Query;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import java.io.IOException;
import java.util.List;

/**
 * Created by Viktor on 02.11.2016.
 */
@Service
public class PhoneNumberServiceImpl implements PhoneNumberService {

    @PersistenceContext
    private EntityManager entityManager;

    @Override
    @Transactional
    public void add(PhoneNumber phoneNumber) {entityManager.merge(phoneNumber);}

    @Override
    @Transactional
    public void delete(int idPhoneNumber) {
        Query query = entityManager.createQuery("SELECT c FROM PhoneNumber c WHERE c.idPhoneNumber = :idPhoneNumber", PhoneNumber.class);
        query.setParameter("idPhoneNumber", idPhoneNumber);
        PhoneNumber phoneNumber = (PhoneNumber) query.getSingleResult();
        entityManager.remove(phoneNumber);
    }

    @Override
    public List<PhoneNumber> listPhoneNumbers() {
        Query query = entityManager.createQuery("SELECT d FROM PhoneNumber d", PhoneNumber.class);
        return (List<PhoneNumber>) query.getResultList();
    }

    @Override
    public List<PhoneNumber> findByUser(User user) {
        Query query = entityManager.createQuery("SELECT c FROM PhoneNumber c where c.user = :user order by c.firstName", PhoneNumber.class);
        query.setParameter("user", user);
        return (List<PhoneNumber>) query.getResultList();
    }
}