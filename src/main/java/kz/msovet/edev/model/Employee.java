package kz.msovet.edev.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotEmpty;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;

@Table(name = "EMPLOYEE")
@Entity
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Employee {

    @Id
    @GeneratedValue(generator = "employee_seq", strategy = GenerationType.AUTO)
    private Long id;

    @Column(name = "FIRST_NAME")
    @NotBlank(message = "Firstname is mandatory")
    private String firstName;

    @Column(name = "LAST_NAME")
    @NotBlank(message = "Lastname is mandatory")
    private String lastName;

    @Column(name = "EMAIL")
    @Email(message = "Email should be valid")
    @NotEmpty(message = "Email is mandatory")
    private String email;

    @Column(name = "GENDER")
    private String gender;

    @OneToMany(fetch = FetchType.LAZY, cascade = CascadeType.REMOVE)
    @JoinColumn(name = "EMPLOYEE_ID", updatable = false)
    private List<Device> devices = new ArrayList<Device>();
}
