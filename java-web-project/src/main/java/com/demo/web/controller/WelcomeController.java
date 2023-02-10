package com.demo.web.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.demo.web.model.Student;

import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Controller
public class WelcomeController {

    private final Logger logger = LoggerFactory.getLogger(WelcomeController.class);
    private final DecimalFormat df = new DecimalFormat("0.00");
    private String username = "test";
    private String password = "test";

    @GetMapping("/")
    public String index(Model model) {
        logger.debug("Index trigger");
        model.addAttribute("userError", "");
        model.addAttribute("passwordError", "");
        model.addAttribute("username", username);
        model.addAttribute("password", password);
        return "index";

    }

    @PostMapping("/")
    public String submit(Model model, HttpServletRequest request, HttpServletResponse response) {
        logger.debug("submit trigger :" + request.getParameter("userID") + "||" + request.getParameter("password"));
        /*boolean correctUsername = request.getParameter("userID").equals(username);
        boolean correctPassword = request.getParameter("password").equals(password);
        if (correctUsername && correctPassword) {
            return "home";
        } else {
            model.addAttribute("userError", correctUsername ?"": "Invalid Username" );
            model.addAttribute("passwordError", correctPassword ?"": "Invalid Password");
            return "index";
        }*/
        List<String> tittleList = new ArrayList<String>();
        tittleList.add("Department");
        tittleList.add("Student ID");
        tittleList.add("Marks");
        tittleList.add("Pass %");

        List<Student> studentList = new ArrayList<Student>();
        
        studentList.add(new Student("Dep 1", "S1", "35"));
        studentList.add(new Student("Dep 1", "S2", "70"));
        studentList.add(new Student("Dep 1", "S3", "60" ));
        studentList.add(new Student("Dep 1", "S4", "90"));
        studentList.add(new Student("Dep 2", "S5", "30" ));
        studentList.add(new Student("Dep 3", "S6","32"));
        studentList.add(new Student("Dep 3", "S7","70"));
        studentList.add(new Student("Dep 3", "S8", "20"));
        
       
      
        List<String> departmentList = new ArrayList<String>();
        studentList.forEach(e-> departmentList.add(e.getDepartment()));
        HashSet<String> hset = new HashSet<String>(departmentList);
        studentList.forEach(e -> {
            logger.info("pass 1 : "+e.getPass());
        });
       
        for (String department : hset) {
            int totalStudentSameDepartment = 0;
            int passStudent = 0;
            for (Student student : studentList) {

                if (department == student.getDepartment()) {
                    totalStudentSameDepartment++;
                    if (Integer.parseInt(student.getMarks()) >= 40) {
                        passStudent++;
                    }
                }
            }
            double passMark = (Double.valueOf(passStudent) /  Double.valueOf(totalStudentSameDepartment))*100;
            // logger.info("passMark 2 : "+ department +"||"+String.valueOf(passMark) +"||"+passStudent + "||"+ totalStudentSameDepartment);
            
            studentList.forEach(e -> {
                if (e.getDepartment() == department)
                    e.setPass(String.valueOf(df.format(passMark)));
            });

        }
        // studentList.forEach(e -> {
        //     logger.info("pass 2 : "+e.getPass());
        // });
      

        
        model.addAttribute("user", username);
        model.addAttribute("tittleList", tittleList);
        model.addAttribute("studentList", studentList);

        return "home";
    }

    @GetMapping("/home")
    public String home(Model model) {
        logger.debug("home trigger");
        return "home";

    }

    public String getMessage() {
        return "Hello World";
    }

}
