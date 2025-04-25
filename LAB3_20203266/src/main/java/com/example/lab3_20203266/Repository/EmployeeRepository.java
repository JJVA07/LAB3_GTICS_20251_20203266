package com.example.lab3_20203266.Repository;

import com.example.lab3_20203266.Dto.EmployeeListDTO;
import com.example.lab3_20203266.Entity.Employee;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface EmployeeRepository extends JpaRepository<Employee, Long> {

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

}

