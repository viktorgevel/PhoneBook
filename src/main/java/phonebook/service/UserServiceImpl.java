package phonebook.service;

import org.springframework.transaction.annotation.Transactional;
import phonebook.entity.User;
import org.springframework.stereotype.Service;
import javax.persistence.Query;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

@Service
public class UserServiceImpl implements UserService {

    @PersistenceContext
    private EntityManager entityManager;

    @Override
    public User getUser(String login) {
        Query query = entityManager.createQuery("SELECT c FROM User c where c.login = :login", User.class);
        query.setParameter("login", login);
        return (User) query.getSingleResult();
    }

    @Override
    @Transactional
    public void add(User user) {
        entityManager.merge(user);
    }
}
