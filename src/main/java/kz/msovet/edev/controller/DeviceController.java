package kz.msovet.edev.controller;

import kz.msovet.edev.model.Device;
import kz.msovet.edev.model.Employee;
import kz.msovet.edev.repo.DeviceRepo;
import kz.msovet.edev.repo.EmployeeRepo;
import kz.msovet.edev.services.EmployeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import javax.validation.Valid;

@Controller
@RequestMapping("/employees")
public class DeviceController {
    @Autowired
    private DeviceRepo deviceRepo;
    @Autowired
    private EmployeeService employeeService;
    @Autowired
    private EmployeeRepo employeeRepo;

    @RequestMapping(value = "{id}/device", method = RequestMethod.GET)
    public String viewDevice(@PathVariable("id") Long employeeId,
                             Model model) {
        Employee employee = employeeService.getEmployee(employeeId);
        model.addAttribute("employee", employee);

        return "devices/create";
    }

    @RequestMapping(value = "{id}/device", method = RequestMethod.POST)
    public String addDevice(ModelMap model,
                            @PathVariable("id") Long employeeId,
                            @ModelAttribute("device") @Valid Device device,
                            BindingResult bindingResult) {

        if (bindingResult.hasErrors()) {
            model.addAttribute("device", device);
            return "devices/create";
        } else {
            employeeService.create(employeeId,device);

            model.addAttribute("message", "Entity created successfully");
            return "devices/create";
        }
    }

    @RequestMapping(value = "{employeeId}/device/{deviceId}/delete", method = RequestMethod.GET)
    public RedirectView deleteDevice(@PathVariable Long employeeId,
                                     @PathVariable Long deviceId) {
        Device device = deviceRepo.getById(deviceId);
        deviceRepo.delete(device);

        return new RedirectView("/employees/" + employeeId);
    }
}
