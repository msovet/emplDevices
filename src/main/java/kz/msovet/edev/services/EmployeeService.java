package kz.msovet.edev.services;

import com.sun.xml.bind.v2.TODO;
import kz.msovet.edev.model.Device;
import kz.msovet.edev.model.Employee;
import kz.msovet.edev.repo.DeviceRepo;
import kz.msovet.edev.repo.EmployeeRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

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
    public void create(Long employeeId, Device device){
        if (employeeRepo.existsById(employeeId)) {
            Employee employee = this.getEmployee(employeeId);
            device.setEmployee(employee);
            deviceRepo.save(device);
        }
    }

//    public List<String> getDevicesName(List<Employee> employees) {
//        List<String> devicesName = new ArrayList<String>();
//        if (!employees.isEmpty()) {
//            for (Employee employee : employees) {
//                devicesName = new ArrayList<String>();
//                List<Device> devices = employee.getDevices();
//                if (!devices.isEmpty()) {
//                    for (Device device :
//                            devices) {
//                        devicesName.add(device.getName());
//                    }
//                }
//                return  devicesName;
//            }
//        }
//        return devicesName;
//    }
}
