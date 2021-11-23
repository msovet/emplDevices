package kz.msovet.edev.controller;

import kz.msovet.edev.model.Category;
import kz.msovet.edev.model.Device;
import kz.msovet.edev.model.Employee;
import kz.msovet.edev.repo.CategoryRepo;
import kz.msovet.edev.repo.EmployeeRepo;
import kz.msovet.edev.services.EmployeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.support.PagedListHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.ServletRequestUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import java.util.List;

@Controller
@RequestMapping("/employees")
public class EmployeeController {

    private final EmployeeRepo employeeRepo;

    @Autowired
    private EmployeeService employeeService;

    @Autowired
    private CategoryRepo categoryRepo;

    @Autowired
    public EmployeeController(EmployeeRepo employeeRepo) {
        this.employeeRepo = employeeRepo;
    }

    @RequestMapping(method = RequestMethod.GET)
    public String getAllEmployees(HttpServletRequest request,
            Model model) {
        List<Employee> employees = employeeRepo.findAll();

        PagedListHolder pagedListHolder = new PagedListHolder(employees);
        int page = ServletRequestUtils.getIntParameter(request,"p", 0);

        pagedListHolder.setPage(page);
        pagedListHolder.setPageSize(3);

        model.addAttribute("employees", employees);
        model.addAttribute("pagedListHolder", pagedListHolder);
        System.out.println(employees.get(0).getDevices().get(0).getCategory().getName());
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
        List<Category> categories = categoryRepo.findAll();

        model.addAttribute("employee", employee);
        model.addAttribute("devices", devices);
        model.addAttribute("categories", categories);

        return "employees/read";
    }

    @RequestMapping(value = "/{id}/update", method = RequestMethod.GET)
    public ModelAndView updateEmployee(@PathVariable Long id) {
        Employee employee = employeeService.getEmployee(id);
        List<Category> categories = categoryRepo.findAll();

        ModelAndView map = new ModelAndView("employees/update");

        map.addObject("categories", categories);
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