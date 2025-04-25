package com.example.lab3_20203266.Repository;

import com.example.lab3_20203266.Entity.Employee;
import org.springframework.data.jpa.repository.JpaRepository;

public interface EmployeeRepository extends JpaRepository<Employee, Long> {}

