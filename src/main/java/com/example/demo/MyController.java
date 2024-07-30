package com.example.demo;

import java.util.List;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

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
    
    @GetMapping("/all")
    public String getAllStudents(Model model) {
        List<Students> data = studentsRepo.findAll();
        model.addAttribute("Students", data);
        return "allstudents"; // Maps to /WEB-INF/jsp/allstudents.jsp
    }
}
