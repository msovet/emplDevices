package kz.msovet.edev.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;

@Table(name = "DEVICE")
@Entity
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Device {
    @Id
    @GeneratedValue(generator = "device_seq", strategy = GenerationType.AUTO)
    private Long id;

//    @Column(name = "CATEGORY")
//    @NotEmpty
//    private String category;
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "CATEGORY_ID",
            foreignKey = @ForeignKey(name = "CATEGORY_DEVICE_FK"),
            nullable = false)
    private Category category;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Column(name = "NAME")
    @NotEmpty
    private String name;

    @Column(name = "GIVEN_DATE")
    private String date;

    @Column(name = "PRICE")
    @NotNull
    private Long price;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "EMPLOYEE_ID",
            foreignKey = @ForeignKey(name = "EMPLOYEE_DEVICE_FK"),
            nullable = false)
    private Employee employee;

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof Device)) return false;
        return id != null && id.equals(((Device) o).getId());
    }

    @Override
    public int hashCode() {
        return getClass().hashCode();
    }
}
