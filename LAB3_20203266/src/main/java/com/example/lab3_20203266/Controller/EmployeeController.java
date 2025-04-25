package com.example.lab3_20203266.Controller;

import com.example.lab3_20203266.Dto.EmployeeListDTO;
import com.example.lab3_20203266.Repository.EmployeeRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/empleados")
public class EmployeeController {

    @Autowired
    EmployeeRepository employeeRepository;

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



}
