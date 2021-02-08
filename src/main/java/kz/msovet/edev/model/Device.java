package kz.msovet.edev.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import javax.validation.constraints.NotEmpty;
import java.sql.Date;

@Table(name = "DEVICE")
@Entity
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Device {
    @Id
    @GeneratedValue(generator = "device_seq", strategy = GenerationType.AUTO)
    private Long id;

    @Column(name = "NAME")
    @NotEmpty
    private String name;

    @Column(name= "GIVEN_DATE")
    @NotEmpty
    private Date givenDate;

    @Column(name= "PRICE")
    @NotEmpty
    private Long price;

    @ManyToOne
    @JoinColumn(name = "employee_id", nullable = false)
    private Employee employee;

}
