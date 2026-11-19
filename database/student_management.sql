```sql
-- ==========================================
-- STUDENT PROFILE AND SKILL DEVELOPMENT
-- MANAGEMENT SYSTEM
-- Q2 - MYSQL DATABASE IMPLEMENTATION
-- ==========================================

-- STEP 1: CREATE DATABASE

CREATE DATABASE IF NOT EXISTS StudentSkillManagementSystem;

USE StudentSkillManagementSystem;


-- STEP 2: CREATE STUDENTS TABLE

CREATE TABLE IF NOT EXISTS students (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(100) NOT NULL,
    email VARCHAR(150) UNIQUE NOT NULL,
    course_name VARCHAR(100) NOT NULL,
    programming_score DECIMAL(5,2) NOT NULL,
    mathematics_score DECIMAL(5,2) NOT NULL,

    CHECK (programming_score BETWEEN 0 AND 100),
    CHECK (mathematics_score BETWEEN 0 AND 100)
);


-- STEP 3: CREATE STUDENT SKILLS TABLE

CREATE TABLE IF NOT EXISTS student_skills (
    id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT NOT NULL,
    skill_name VARCHAR(100) NOT NULL,

    FOREIGN KEY (student_id)
    REFERENCES students(student_id)
    ON DELETE CASCADE,

    UNIQUE (student_id, skill_name)
);


-- STEP 4: INSERT SAMPLE STUDENT DATA

INSERT INTO students
(student_id, student_name, email, course_name,
 programming_score, mathematics_score)
VALUES
(101, 'Tejas Mishra', 'tejas@gmail.com', 'B.Tech CSE', 90, 85),
(102, 'Rahul Sharma', 'rahul@gmail.com', 'B.Tech CSE', 65, 92),
(103, 'Aman Verma', 'aman@gmail.com', 'B.Tech IT', 45, 80),
(104, 'Priya Singh', 'priya@gmail.com', 'B.Tech CSE', 75, 70),
(105, 'Rohit Kumar', 'rohit@gmail.com', 'B.Tech IT', 40, 90);


-- STEP 5: INSERT TECHNICAL SKILLS

INSERT INTO student_skills (student_id, skill_name)
VALUES
(101, 'Java'),
(101, 'Python'),
(101, 'SQL'),
(102, 'Java'),
(102, 'Python'),
(103, 'C'),
(103, 'SQL'),
(104, 'Java'),
(104, 'SQL'),
(105, 'Python'),
(105, 'SQL');


-- STEP 6: DISPLAY ALL STUDENTS WITH AVERAGE SCORE

SELECT
    student_id,
    student_name,
    programming_score,
    mathematics_score,
    (programming_score + mathematics_score) / 2
    AS average_score
FROM students;


-- STEP 7: ASSIGN PERFORMANCE CATEGORY

SELECT
    student_id,
    student_name,
    (programming_score + mathematics_score) / 2
    AS average_score,

    CASE
        WHEN (programming_score + mathematics_score) / 2 >= 85
            THEN 'Excellent'

        WHEN (programming_score + mathematics_score) / 2 >= 70
            THEN 'Good'

        WHEN (programming_score + mathematics_score) / 2 >= 50
            THEN 'Satisfactory'

        ELSE 'Needs Improvement'
    END AS performance_category

FROM students;


-- STEP 8: IDENTIFY STRONGER SUBJECT

SELECT
    student_id,
    student_name,

    CASE
        WHEN programming_score > mathematics_score
            THEN 'Programming'

        WHEN mathematics_score > programming_score
            THEN 'Mathematics'

        ELSE 'Both are Equal'
    END AS stronger_subject

FROM students;


-- STEP 9: SEARCH STUDENT BY ID

SELECT * FROM students
WHERE student_id = 101;


-- SEARCH STUDENT BY EMAIL

SELECT * FROM students
WHERE email = 'tejas@gmail.com';


-- SEARCH STUDENT BY COURSE

SELECT * FROM students
WHERE course_name = 'B.Tech CSE';


-- STEP 10: DISPLAY MERIT LIST
-- HIGHEST AVERAGE SCORE FIRST

SELECT
    student_id,
    student_name,
    (programming_score + mathematics_score) / 2
    AS average_score

FROM students

ORDER