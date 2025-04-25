package com.example.lab3_20203266.Repository;

import com.example.lab3_20203266.Entity.Department;
import org.springframework.data.jpa.repository.JpaRepository;

public interface DepartmentRepository extends JpaRepository<Department, Integer> {
}
