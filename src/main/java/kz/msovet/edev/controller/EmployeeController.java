package kz.msovet.edev.controller;

import kz.msovet.edev.model.Employee;
import kz.msovet.edev.repo.EmployeeRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.validation.Valid;
import java.util.List;

@Controller
@RequestMapping("/employees")
public class EmployeeController {

    private final EmployeeRepo employeeRepo;

    @Autowired
    public EmployeeController(EmployeeRepo employeeRepo) {
        this.employeeRepo = employeeRepo;
    }

    @RequestMapping(value = "/one", method = RequestMethod.POST)
    public String addEmployee(ModelMap model,
                              @ModelAttribute("employee") @Valid Employee employee,
                              BindingResult bindingResult) {

        if (bindingResult.hasErrors()) {
            model.addAttribute("employee", employee);
            return "create";
        } else {
            employeeRepo.save(employee);
            return "index";
        }
    }

    @RequestMapping(value = "/one", method = RequestMethod.GET)
    public String viewCreate() {
        return "create";
    }

    @RequestMapping(method = RequestMethod.GET)
    public String getAllEmployees(Model model) {
        List<Employee> employees = employeeRepo.findAll();
        model.addAttribute("employees", employees);

        return "index";
    }
}