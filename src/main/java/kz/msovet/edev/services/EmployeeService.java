package kz.msovet.edev.services;

import kz.msovet.edev.model.Employee;
import kz.msovet.edev.repo.EmployeeRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class EmployeeService {
    @Autowired
    private EmployeeRepo employeeRepo;

    public Employee getEmployee(Long id) {
        return employeeRepo.getById(id);
    }
    public void update(Employee employee) {

        employeeRepo.save(employee);
        System.out.println("EmployeeService.updateEmployee() invoked " + employee);
    }
}
