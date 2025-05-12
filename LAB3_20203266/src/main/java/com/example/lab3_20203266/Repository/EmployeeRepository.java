package com.example.lab3_20203266.Repository;

import com.example.lab3_20203266.Dto.ReporteSalarioDTO;
import com.example.lab3_20203266.Entity.Employee;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface EmployeeRepository extends JpaRepository<Employee, Long> {

    @Query("""
SELECT 
    MAX(e.salary) AS maxSalary,
    MIN(e.salary) AS minSalary,
    CONCAT(MAX(e.firstName), ' ', MAX(e.lastName)) AS nombreTop,
    j.jobTitle AS puesto,
    ROUND(AVG(e.salary), 2) AS avgSalary
FROM Employee e
JOIN e.job j
GROUP BY j.jobTitle
""")
    List<ReporteSalarioDTO> obtenerReporte();

    @Query("""
SELECT 
    MAX(e.salary) AS maxSalary,
    MIN(e.salary) AS minSalary,
    CONCAT(MAX(e.firstName), ' ', MAX(e.lastName)) AS nombreTop,
    j.jobTitle AS puesto,
    ROUND(AVG(e.salary), 2) AS avgSalary
FROM Employee e
JOIN e.job j
WHERE LOWER(e.firstName) LIKE LOWER(CONCAT('%', :nombre, '%'))
GROUP BY j.jobTitle
""")
    List<ReporteSalarioDTO> obtenerReporteFiltradoPorNombre(@Param("nombre") String nombre);

}

