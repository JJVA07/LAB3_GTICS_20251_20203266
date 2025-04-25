package com.example.lab3_20203266.Repository;

import com.example.lab3_20203266.Entity.Job;
import org.springframework.data.jpa.repository.JpaRepository;

public interface JobRepository extends JpaRepository<Job, String> {
}

