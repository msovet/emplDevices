package kz.msovet.edev.controller;

import kz.msovet.edev.model.Device;
import kz.msovet.edev.model.Employee;
import kz.msovet.edev.repo.EmployeeRepo;
import kz.msovet.edev.services.EmployeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import javax.validation.Valid;
import java.util.List;
import java.util.Optional;
import java.util.Set;

@Controller
@RequestMapping("/employees")
public class EmployeeController {

    private final EmployeeRepo employeeRepo;

    @Autowired
    private EmployeeService employeeService;

    @Autowired
    public EmployeeController(EmployeeRepo employeeRepo) {
        this.employeeRepo = employeeRepo;
    }

    @RequestMapping(method = RequestMethod.GET)
    public String getAllEmployees(Model model) {
        List<Employee> employees = employeeRepo.findAll();
        model.addAttribute("employees", employees);

//        model.addAttribute("devices", devicesName);

        return "employees/index";
    }

    @RequestMapping(value = "/create", method = RequestMethod.GET)
    public String viewCreate() {
        return "employees/create";
    }

    @RequestMapping(value = "/create", method = RequestMethod.POST)
    public String addEmployee(ModelMap model,
                              @ModelAttribute("employee") @Valid Employee employee,
                              BindingResult bindingResult) {

        if (bindingResult.hasErrors()) {
            model.addAttribute("employee", employee);
            return "employees/create";
        } else {
            employeeRepo.save(employee);
            model.addAttribute("message", "Entity created successfully");

            return "employees/create";
        }
    }

    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    public String getEmployee(@PathVariable("id") Long employeeId,
                              Model model) {
        Employee employee = employeeService.getEmployee(employeeId);
        List<Device> devices = employee.getDevices();

        model.addAttribute("employee", employee);
        model.addAttribute("devices", devices);

        return "employees/read";
    }

    @RequestMapping(value = "/{id}/update", method = RequestMethod.GET)
    public ModelAndView updateEmployee(@PathVariable Long id) {
        Employee employee = employeeService.getEmployee(id);
        ModelAndView map = new ModelAndView("employees/update");
        map.addObject("employee", employee);
        return map;
    }

    @RequestMapping(value = "/{id}/update", method = RequestMethod.POST)
    public String updateEmployee(@ModelAttribute("employee") @Valid Employee employee,
                                 @PathVariable("id") Long id,
                                 ModelMap model,
                                 BindingResult bindingResult) {
        if (bindingResult.hasErrors()) {
            model.addAttribute("employee", employee);
            return "update";
        } else {
            employeeService.update(employee);
            model.addAttribute("message", "Entity updated successfully");

            return "employees/update";
        }
    }

    @RequestMapping(value = "/{id}/delete", method = RequestMethod.GET)
    public RedirectView deleteEmployee(@PathVariable("id") Long id) {
        Employee employee = employeeRepo.getById(id);
        employeeRepo.delete(employee);

        return new RedirectView("/employees");
    }
}