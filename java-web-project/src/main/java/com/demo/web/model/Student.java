package com.demo.web.model;

public class Student {

    private String department;
    private String studentID;
    private String marks;
    private String pass;

    public Student(String department,String studentID,String marks) {
        this.department = department;
        this.studentID = studentID;
        this.marks = marks;
    }

    public String getDepartment() {
        return this.department;
    }

    public void setDepartment(String department) {
        this.department = department;
    }

    public String getStudentID() {
        return this.studentID;
    }

    public void setStudentID(String studentID) {
        this.studentID = studentID;
    }

    public String getMarks() {
        return this.marks;
    }

    public void setMarks(String marks) {
        this.marks = marks;
    }

    public String getPass() {
        return this.pass;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }

}