package kz.msovet.edev.repo;

import kz.msovet.edev.model.Device;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface DeviceRepo extends JpaRepository<Device, Long> {
    Device getById(Long id);
    void delete(Device device);
}
