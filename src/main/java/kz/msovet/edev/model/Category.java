package kz.msovet.edev.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

import javax.persistence.*;
import javax.validation.constraints.NotEmpty;
import java.util.ArrayList;
import java.util.List;

@Table(name = "CATEGORY")
@Entity
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Category {
    @Id
    @GeneratedValue(generator = "category_seq", strategy = GenerationType.AUTO)
    private Long id;

    @Column(name = "NAME")
    @NotEmpty
    private String name;

    @ToString.Exclude
    @OneToMany(
            mappedBy = "category",
            cascade = CascadeType.ALL,
            fetch = FetchType.LAZY,
            orphanRemoval = true)
    private List<Device> devices = new ArrayList<>();

    public void addDevice(Device device) {
        devices.add(device);
        device.setCategory(this);
    }
    public void removeDevice(Device device) {
        devices.remove(device);
        device.setEmployee(null);
    }
}
