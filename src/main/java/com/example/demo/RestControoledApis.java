package com.example.demo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class RestControoledApis {
 @Autowired
 private StudentsRepo studentsRepo;
 
 
 @GetMapping("/api/students")
 public List<Students> getData(){
	 return studentsRepo.findAll();
 }
}
