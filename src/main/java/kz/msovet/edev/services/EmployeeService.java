package kz.msovet.edev.services;

import kz.msovet.edev.model.Device;
import kz.msovet.edev.model.Employee;
import kz.msovet.edev.repo.DeviceRepo;
import kz.msovet.edev.repo.EmployeeRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class EmployeeService {
    @Autowired
    private EmployeeRepo employeeRepo;

    @Autowired
    private DeviceRepo deviceRepo;

    public Employee getEmployee(Long id) {
        return employeeRepo.getById(id);
    }

    public void update(Employee employee) {
        employee.setGender(employeeRepo.getById(employee.getId()).getGender());
        // TODO
        employee.setDevices(employeeRepo.getById(employee.getId()).getDevices());
        employeeRepo.save(employee);
        System.out.println("EmployeeService.updateEmployee() invoked " + employee);
    }

    public void create(Long employeeId, Device device) {
        if (employeeRepo.existsById(employeeId)) {
            Employee employee = this.getEmployee(employeeId);
            device.setEmployee(employee);
            deviceRepo.save(device);
        }
    }

    public Iterable<Employee> findAll() {
        return employeeRepo.findAll();
    }
}
