	CREATE DATABASE new;
    #Unique Constraint
    use new;
    CREATE TABLE users (
    user_id INT PRIMARY KEY,
    user_name VARCHAR(100),
    email VARCHAR(100) UNIQUE
);
INSERT INTO users (user_id, user_name, email) VALUES
(1, 'Anjali Menon', 'anjali.menon@example.com'),
(2, 'Ravi Kumar', 'ravi.kumar@example.com'),
(3, 'Lakshmi Iyer', 'lakshmi.iyer@example.com'),
(4, 'Vikram Reddy', 'vikram.reddy@example.com');

SELECT * FROM users;

#Check Constrain
CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    price DECIMAL(10, 2) CHECK (price > 0)
);
ALTER TABLE products
ADD price DECIMAL(10, 2) CHECK (price > 0);

#PRIMARY KEY AND CONSTRAINT
CREATE TABLE courses (
    course_id INT,
    course_name VARCHAR(100),
    department_id INT,
    PRIMARY KEY (course_id, department_id)
);

# Foreign Key and Consistency:
CREATE TABLE students (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(100)
);
CREATE TABLE course (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(100)
);
CREATE TABLE student_course1 (
    student_id INT,
    course_id INT,
    PRIMARY KEY (student_id, course_id),
    FOREIGN KEY (student_id) REFERENCES students(student_id),
    FOREIGN KEY (course_id) REFERENCES course(course_id)
);
INSERT INTO students (student_id, student_name) VALUES
(1, 'Anjali Menon'),
(2, 'Ravi Kumar'),
(3, 'Lakshmi Iyer'),
(4, 'Vikram Reddy');
INSERT INTO course (course_id, course_name) VALUES
(101, 'Introduction to Programming'),
(102, 'Data Structures'),
(103, 'Database Systems');
INSERT INTO student_course1 (student_id, course_id) VALUES
(1, 101),  # Anjali Menon enrolls in Introduction to Programming
(2, 102),  # Ravi Kumar enrolls in Data Structures
(1, 103),  # Anjali Menon enrolls in Database Systems
(3, 101),  # Lakshmi Iyer enrolls in Introduction to Programming
(4, 102);   #Vikram Reddy enrolls in Data Structures

SELECT * FROM students;
SELECT * FROM course;
SELECT * FROM student_course1;

#NOT NULL CONSTRAINT
CREATE TABLE user (
    user_id INT PRIMARY KEY,
    username VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL
);
# Adding a Check Constraint to an Existing Table
CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(100),
    salary DECIMAL(10,2)
);
ALTER TABLE employees
ADD CONSTRAINT chk_salary CHECK (salary > 0);








