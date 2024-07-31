package com.example.demo;

import java.util.List;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.google.gson.Gson;

@Controller
public class MyController {
 
    public final StudentsRepo studentsRepo;
    
    public MyController(StudentsRepo studentsRepo) {
        this.studentsRepo = studentsRepo;
    }
    
    @GetMapping("/example")
    public String examplePage() {
        return "example"; // Maps to /WEB-INF/jsp/example.jsp
    }
    
    @GetMapping("/vue")
    public String vue(Model model) { 
    	model.addAttribute("message", "Hello from Spring Boot Controller!");
        return "simplevue"; // Maps to /WEB-INF/jsp/example.jsp
    }
    
    @GetMapping("/studentsapi")
    public String studentsPage() {
        return "studentsapi"; // This will resolve to /WEB-INF/views/students.jsp
    }
    
    
    @GetMapping("/all")
    public String getAllStudents(Model model) {
        List<Students> data = studentsRepo.findAll();
        model.addAttribute("students", data);
        return "allstudents"; // Maps to /WEB-INF/jsp/allstudents.jsp
    }
    
    
    @GetMapping("/alljstl")
    public String getAllStudentsSTL(Model model) {
        List<Students> data = studentsRepo.findAll();
        model.addAttribute("students", data);
        return "allStudentsJSTL"; // Maps to /WEB-INF/jsp/allstudents.jsp
    }
    
    
    @GetMapping("/students")
    public String getStudents(Model model) {
        List<Students> students = studentsRepo.findAll(); // Replace with actual service call
        model.addAttribute("students", new Gson().toJson(students)); // Convert list to JSON string
        return "studentsvue"; // JSP page name (students.jsp)
    }
}
