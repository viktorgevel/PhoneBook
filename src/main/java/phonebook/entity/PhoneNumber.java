package phonebook.entity;

import javax.persistence.*;

@Entity
@Table(name = "phonenumbers")
public class PhoneNumber {

    @Id
    @GeneratedValue
    private int idPhoneNumber;
    private String firstName;
    private String secondName;
    private String patronymic;
    private String phoneMobile;
    private String phoneHome;
    private String address;
    private String eMail;
    private String name;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name="idUser")
    private User user;

    public PhoneNumber(String firstName, String secondName, String patronymic, String phoneMobile, String phoneHome,
                       String address, String eMail, User user) {
        this.firstName = firstName;
        this.secondName = secondName;
        this.patronymic = patronymic;
        this.phoneMobile = phoneMobile;
        this.phoneHome = phoneHome;
        this.address = address;
        this.eMail = eMail;
        this.user = user;
    }

    public PhoneNumber() {}

    public int getIdPhoneNumber() {return idPhoneNumber;}
    public String getFirstName() {return firstName;}
    public String getSecondName() {return secondName;}
    public String getPatronymic() {return patronymic;}
    public String getPhoneMobile() {return phoneMobile;}
    public String getPhoneHome() {return phoneHome;}
    public String getAddress() {return address;}
    public String getEMail() {return eMail;}
    public String getName() {return firstName + " " + secondName + " " + patronymic;}
}
