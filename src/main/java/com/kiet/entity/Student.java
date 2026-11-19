package com.kiet.entity;

import java.util.ArrayList;
import java.util.List;

public class Student {

    // Private Attributes (Encapsulation)
    private int studentId;
    private String studentName;
    private String email;
    private String courseName;
    private double programmingScore;
    private double mathematicsScore;
    private List<String> technicalSkills;

    // Default Constructor
    public Student() {
        this.technicalSkills = new ArrayList<>();
    }

    // Parameterized Constructor
    public Student(int studentId, String studentName, String email,
                   String courseName, double programmingScore,
                   double mathematicsScore, List<String> technicalSkills) {

        this.studentId = studentId;
        this.studentName = studentName;
        this.email = email;
        this.courseName = courseName;
        this.programmingScore = programmingScore;
        this.mathematicsScore = mathematicsScore;
        this.technicalSkills = technicalSkills == null
                ? new ArrayList<>()
                : new ArrayList<>(technicalSkills);
    }

    // Getters and Setters

    public int getStudentId() {
        return studentId;
    }

    public void setStudentId(int studentId) {
        this.studentId = studentId;
    }

    public String getStudentName() {
        return studentName;
    }

    public void setStudentName(String studentName) {
        this.studentName = studentName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getCourseName() {
        return courseName;
    }

    public void setCourseName(String courseName) {
        this.courseName = courseName;
    }

    public double getProgrammingScore() {
        return programmingScore;
    }

    public void setProgrammingScore(double programmingScore) {
        this.programmingScore = programmingScore;
    }

    public double getMathematicsScore() {
        return mathematicsScore;
    }

    public void setMathematicsScore(double mathematicsScore) {
        this.mathematicsScore = mathematicsScore;
    }

    public List<String> getTechnicalSkills() {
        return new ArrayList<>(technicalSkills);
    }

    public void setTechnicalSkills(List<String> technicalSkills) {
        this.technicalSkills = technicalSkills == null
                ? new ArrayList<>()
                : new ArrayList<>(technicalSkills);
    }

    // Calculate Average
    public double calculateAverage() {
        return (programmingScore + mathematicsScore) / 2.0;
    }

    // Performance Category
    public String getPerformanceCategory() {

        double avg = calculateAverage();

        if (avg >= 85) {
            return "Excellent";
        } else if (avg >= 70) {
            return "Good";
        } else if (avg >= 50) {
            return "Satisfactory";
        } else {
            return "Needs Improvement";
        }
    }

    // Stronger Subject
    public String getStrongerSubject() {

        if (programmingScore > mathematicsScore) {
            return "Programming";
        } else if (mathematicsScore > programmingScore) {
            return "Mathematics";
        } else {
            return "Both are Equal";
        }
    }

    // Display Student Details
    public void displayStudent() {

        System.out.println("Student ID: " + studentId);
        System.out.println("Name: " + studentName);
        System.out.println("Email: " + email);
        System.out.println("Course: " + courseName);
        System.out.println("Programming Score: " + programmingScore);
        System.out.println("Mathematics Score: " + mathematicsScore);
        System.out.println("Technical Skills: " + technicalSkills);
        System.out.println("Average: " + calculateAverage());
        System.out.println("Performance: " + getPerformanceCategory());
        System.out.println("Stronger Subject: " + getStrongerSubject());
    }

}