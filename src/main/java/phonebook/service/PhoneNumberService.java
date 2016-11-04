package phonebook.service;

import phonebook.entity.PhoneNumber;
import phonebook.entity.User;

import java.io.IOException;
import java.util.List;

public interface PhoneNumberService {
    void add(PhoneNumber phoneNumber);
    void delete(int idPhoneNumber);
    List<PhoneNumber> listPhoneNumbers();
    List<PhoneNumber> findByUser(User user);
}
