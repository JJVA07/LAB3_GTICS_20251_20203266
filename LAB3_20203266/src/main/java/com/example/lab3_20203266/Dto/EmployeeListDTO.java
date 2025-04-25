package com.example.lab3_20203266.Dto;

public interface EmployeeListDTO {
    Long getEmployeeId();
    String getFirstName();
    String getLastName();
    String getJob_Title(); // nuevo nombre plano
    String getDepartmentName();
    String getCity();
    String getPostalCode();
    Double getSalary();
}
