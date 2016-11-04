package phonebook.service;

import phonebook.entity.User;

public interface UserService {

    User getUser(String login);

    void add(User user);
}
