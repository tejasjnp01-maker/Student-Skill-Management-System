package com.kiet.entity;

import java.util.Arrays;
import java.util.List;

public class StudentTest {

    public static void main(String[] args) {

        // Creating Technical Skills List
        List<String> skills = Arrays.asList(
                "Java",
                "Python",
                "SQL",
                "Spring Boot"
        );

        // Creating Student Object
        Student s1 = new Student(
                101,
                "Tejas Mishra",
                "tejas@gmail.com",
                "B.Tech CSE",
                90,
                85,
                skills
        );

        // Display Student Details
        s1.displayStudent();

    }
}