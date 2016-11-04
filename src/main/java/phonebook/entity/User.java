package phonebook.entity;

import org.apache.commons.codec.digest.DigestUtils;

import javax.persistence.*;
import java.util.List;

@Entity
@Table(name = "users")
public class User {
    @Id
    @GeneratedValue
    private int idUser;
    private String login;
    private String password;
    private String name;
    @OneToMany(fetch = FetchType.EAGER, mappedBy = "user", cascade = CascadeType.ALL)
    private List<PhoneNumber> phoneNumbers;


    public User(String login, String password, String name) {
        this.login = login;
        this.password = DigestUtils.sha1Hex(password);
        this.name = name;
    }

    public User() {}

    public int getIdUser() {
        return idUser;
    }

    public String getLogin() {return login;}
    public void setLogin(String login) {this.login = login;}
    public String getPassword() {return password;}
    public void setPassword(String password) {this.password = password;}
}