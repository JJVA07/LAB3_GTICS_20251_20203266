package com.example.lab3_20203266.Controller;

import com.example.lab3_20203266.Dto.ReporteSalarioDTO;
import com.example.lab3_20203266.Repository.EmployeeRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
@RequestMapping("/empleados")
public class EmployeeController {

    @Autowired
    EmployeeRepository employeeRepository;

    @GetMapping("/reporte")
    public String mostrarReporte(@RequestParam(required = false) String nombre, Model model) {
        List<ReporteSalarioDTO> reporte;

        if (nombre != null && !nombre.isEmpty()) {
            reporte = employeeRepository.obtenerReporteFiltradoPorNombre(nombre);
        } else {
            reporte = employeeRepository.obtenerReporte();
        }

        model.addAttribute("reporte", reporte);
        model.addAttribute("nombre", nombre); // <-- importante para mantener el valor en el input
        return "employee/reporte";
    }


}
