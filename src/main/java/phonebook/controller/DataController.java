package phonebook.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import phonebook.entity.PhoneNumber;
import phonebook.entity.User;
import phonebook.service.PhoneNumberService;
import phonebook.service.UserService;
import org.springframework.ui.Model;
import org.springframework.security.core.context.SecurityContextHolder;

import java.io.IOException;
import java.util.List;

@Controller
public class DataController {

    @Autowired
    private UserService userService;

    @Autowired
    private PhoneNumberService phoneNumberService;

    @RequestMapping(value = "/createnewuser", method = RequestMethod.POST)
    public String createNewUser (@RequestParam String j_username, @RequestParam String j_password, @RequestParam String name) {
        phonebook.entity.User user = new phonebook.entity.User(j_username, j_password, name);
        userService.add(user);
        return "login";
    }

    @RequestMapping(value = "/home")
    public String homePageOfUser(Model model) {
        org.springframework.security.core.userdetails.User user = (org.springframework.security.core.userdetails.User)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        phonebook.entity.User user1 = userService.getUser(user.getUsername());
        List<PhoneNumber> phoneNumbers = phoneNumberService.findByUser(user1);
        model.addAttribute("phonenumbers", phoneNumbers);
        return "home";
    }

    @RequestMapping(value = "/addnewcontacttodatabase", method = RequestMethod.POST)
    public String addNewContact (@RequestParam String firstName, @RequestParam String secondName, @RequestParam String patronymic,
                                 @RequestParam String phoneMobile, @RequestParam String phoneHome, @RequestParam String address,
                                 @RequestParam String eMail) {
        org.springframework.security.core.userdetails.User user = (org.springframework.security.core.userdetails.User)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        phonebook.entity.User user1 = userService.getUser(user.getUsername());
        PhoneNumber phoneNumber = new PhoneNumber(firstName, secondName, patronymic, phoneMobile, phoneHome, address, eMail, user1);
        phoneNumberService.add(phoneNumber);
        return "index";
    }

    @RequestMapping(value = "/deletecontact", method = RequestMethod.GET)
    public String deleteContactBegin (Model model) {
        org.springframework.security.core.userdetails.User user = (org.springframework.security.core.userdetails.User)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        phonebook.entity.User user1 = userService.getUser(user.getUsername());
        model.addAttribute("phonenumbers", phoneNumberService.findByUser(user1));
        return "deletecontact";
    }

    @RequestMapping(value = "/deletesomephonenumber", method = RequestMethod.POST)
    public String deleteContactEnd (@RequestParam int deletePhoneNumberId) {
        phoneNumberService.delete(deletePhoneNumberId);
        return "index";
    }

}