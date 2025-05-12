package com.example.lab3_20203266.Repository;

import com.example.lab3_20203266.Dto.EmployeeEditDTO;
import com.example.lab3_20203266.Dto.EmployeeListDTO;
import com.example.lab3_20203266.Dto.ReporteSalarioDTO;
import com.example.lab3_20203266.Entity.Employee;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

public interface EmployeeRepository extends JpaRepository<Employee, Long> {

    // --- Pregunta 3 (Listar empleados con filtro) ---
    @Query("""
        SELECT e.employeeId AS employeeId,
               e.firstName AS firstName,
               e.lastName AS lastName,
               j.jobTitle AS job_Title,
               d.departmentName AS departmentName,
               l.city AS city,
               l.postalCode AS postalCode,
               e.salary AS salary
        FROM Employee e
        JOIN e.job j
        JOIN e.department d
        JOIN d.location l
        WHERE LOWER(e.firstName) LIKE LOWER(CONCAT('%', :nombre, '%'))
    """)
    List<EmployeeListDTO> buscarPorNombre(@Param("nombre") String nombre);

    @Query("""
        SELECT e.employeeId AS employeeId,
               e.firstName AS firstName,
               e.lastName AS lastName,
               j.jobTitle AS job_Title,
               d.departmentName AS departmentName,
               l.city AS city,
               l.postalCode AS postalCode,
               e.salary AS salary
        FROM Employee e
        JOIN e.job j
        JOIN e.department d
        JOIN d.location l
        WHERE LOWER(d.departmentName) LIKE LOWER(CONCAT('%', :dep, '%'))
    """)
    List<EmployeeListDTO> buscarPorDepartamento(@Param("dep") String departamento);

    @Query("""
        SELECT e.employeeId AS employeeId,
               e.firstName AS firstName,
               e.lastName AS lastName,
               j.jobTitle AS job_Title,
               d.departmentName AS departmentName,
               l.city AS city,
               l.postalCode AS postalCode,
               e.salary AS salary
        FROM Employee e
        JOIN e.job j
        JOIN e.department d
        JOIN d.location l
    """)
    List<EmployeeListDTO> findAllProjectedBy();

    // --- Pregunta 4 (Editar ciudad y postal) ---
    @Query("""
        SELECT e.employeeId AS employeeId,
               e.firstName AS firstName,
               e.lastName AS lastName,
               j.jobTitle AS jobTitle,
               d.departmentName AS departmentName,
               l.city AS city,
               l.postalCode AS postalCode
        FROM Employee e
        JOIN e.job j
        JOIN e.department d
        JOIN d.location l
        WHERE e.employeeId = :id
    """)
    EmployeeEditDTO getEditData(@Param("id") Long id);

    @Transactional
    @Modifying
    @Query("""
        UPDATE Location l SET l.city = :city, l.postalCode = :postalCode
        WHERE l.locationId = :locationId
    """)
    void actualizarCiudadYCodigoPostal(@Param("city") String city,
                                       @Param("postalCode") String postalCode,
                                       @Param("locationId") Long locationId);

    // --- Pregunta 5 (Reporte de sueldos) ---
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
