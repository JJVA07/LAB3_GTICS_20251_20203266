package com.example.lab3_20203266.Controller;

import com.example.lab3_20203266.Dto.EmployeeEditDTO;
import com.example.lab3_20203266.Dto.EmployeeListDTO;
import com.example.lab3_20203266.Entity.Employee;
import com.example.lab3_20203266.Entity.Location;
import com.example.lab3_20203266.Repository.EmployeeRepository;
import com.example.lab3_20203266.Repository.LocationRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/empleados")
public class EmployeeController {

    @Autowired
    EmployeeRepository employeeRepository;
    @Autowired
    LocationRepository locationRepository;


    @GetMapping
    public String listarEmpleados(@RequestParam(required = false) String filtro,
                                  @RequestParam(required = false) String valor,
                                  Model model) {

        List<EmployeeListDTO> empleados;

        if ("nombre".equalsIgnoreCase(filtro) && valor != null && !valor.isEmpty()) {
            empleados = employeeRepository.buscarPorNombre(valor);
        } else if ("departamento".equalsIgnoreCase(filtro) && valor != null && !valor.isEmpty()) {
            empleados = employeeRepository.buscarPorDepartamento(valor);
        } else {
            empleados = employeeRepository.findAllProjectedBy();
        }

        model.addAttribute("empleados", empleados);
        model.addAttribute("filtro", filtro);
        model.addAttribute("valor", valor);
        return "employee/lista";
    }

    @GetMapping("/editar/{id}")
    public String mostrarFormularioEdicion(@PathVariable Long id, Model model) {
        EmployeeEditDTO dto = employeeRepository.getEditData(id);
        model.addAttribute("empleado", dto);
        return "employee/editar";
    }

    @PostMapping("/editar/{id}")
    @Transactional
    public String guardarCambios(@PathVariable Long id,
                                 @RequestParam String city,
                                 @RequestParam String postalCode) {
        Employee empleado = employeeRepository.findById(id).orElse(null);
        if (empleado != null) {
            Long locationId = empleado.getDepartment().getLocation().getLocationId().longValue();
            locationRepository.actualizarCiudadYCodigoPostal(city, postalCode, locationId);
        }
        return "redirect:/empleados";
    }






}
