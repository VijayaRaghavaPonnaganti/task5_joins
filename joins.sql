
CREATE DATABASE new_db1;
USE new_db1;
#Inner Join
CREATE TABLE customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_name VARCHAR(100) NOT NULL
);

CREATE TABLE orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    product_name VARCHAR(100) NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);
#Inserting data into the customers table
INSERT INTO customers (customer_name) VALUES
('Aarav Sharma'),
('Diya Patel'),
('Kabir Khan'),
('Isha Gupta'),
('Rohan Verma');

#Inserting data into the orders table
INSERT INTO orders (customer_id, product_name) VALUES
(1, 'Laptop'),
(1, 'Wireless Mouse'),
(2, 'Smartphone'),
(3, 'Headphones'),
(4, 'Smartwatch'),
(5, 'Gaming Console'),
(1, 'Monitor'),
(3, 'Webcam'),
(2, 'Office Chair');

SELECT * FROM customers;
SELECT * FROM orders;
#Inner join
SELECT c.customer_name, o.product_name
FROM customers c
INNER JOIN orders o ON c.customer_id = o.customer_id;
#Left join
SELECT c.customer_name, o.product_name
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id;

#right join
CREATE TABLE products (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL
);

CREATE TABLE suppliers (
    supplier_id INT AUTO_INCREMENT PRIMARY KEY,
    supplier_name VARCHAR(100) NOT NULL
);

CREATE TABLE product_suppliers (
    product_id INT,
    supplier_id INT,
    PRIMARY KEY (product_id, supplier_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id),
    FOREIGN KEY (supplier_id) REFERENCES suppliers(supplier_id)
);

-- Inserting data into the products table
INSERT INTO products (product_name) VALUES
('Laptop'),
('Smartphone'),
('Tablet'),
('Headphones'),
('Smartwatch');

-- Inserting data into the suppliers table
INSERT INTO suppliers (supplier_name) VALUES
('Supplier A'),
('Supplier B'),
('Supplier C'),
('Supplier D');

#Inserting data into the product_suppliers table
INSERT INTO product_suppliers (product_id, supplier_id) VALUES
(1, 1),  -- Laptop from Supplier A
(1, 2),  -- Laptop from Supplier B
(2, 1),  -- Smartphone from Supplier A
(2, 3),  -- Smartphone from Supplier C
(3, 2),  -- Tablet from Supplier B
(4, 4),  -- Headphones from Supplier D
(5, 3);  -- Smartwatch from Supplier C

SELECT * FROM products;
SELECT * FROM suppliers;
SELECT * FROM product_suppliers;

SELECT p.product_name, s.supplier_name
FROM products p
RIGHT JOIN product_suppliers ps ON p.product_id = ps.product_id
RIGHT JOIN suppliers s ON ps.supplier_id = s.supplier_id;

#FULL OUTER JOIN
CREATE TABLE departments (
    department_id INT AUTO_INCREMENT PRIMARY KEY,
    department_name VARCHAR(100) NOT NULL
);

CREATE TABLE employees (
    employee_id INT AUTO_INCREMENT PRIMARY KEY,
    employee_name VARCHAR(100) NOT NULL,
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES departments(department_id)
);

#Inserting data into the departments table
INSERT INTO departments (department_name) VALUES
('Human Resources'),
('Finance'),
('IT'),
('Marketing'),
('Sales');

-- Inserting data into the employees table with Indian names
INSERT INTO employees (employee_name, department_id) VALUES
('Aarav Sharma', 1),
('Diya Patel', 2),
('Kabir Khan', 3),
('Isha Gupta', 4),
('Rohan Verma', 5);

SELECT * FROM departments;
SELECT * FROM employees;

SELECT e.employee_name, d.department_name
FROM employees e
LEFT JOIN departments d ON e.department_id = d.department_id

UNION

SELECT e.employee_name, d.department_name
FROM employees e
RIGHT JOIN departments d ON e.department_id = d.department_id;

#SELF JOIN
CREATE TABLE employes (
    employee_id INT AUTO_INCREMENT PRIMARY KEY,
    employee_name VARCHAR(100) NOT NULL,
    manager_id INT,
    FOREIGN KEY (manager_id) REFERENCES employees(employee_id)
);
-- Inserting sample data into the employes table
INSERT INTO employes (employee_name, manager_id) VALUES
('Aarav Sharma', NULL),  -- Aarav has no manager (top-level)
('Diya Patel', 1),       -- Diya reports to Aarav
('Kabir Khan', 1),       -- Kabir reports to Aarav
('Isha Gupta', 2),       -- Isha reports to Diya
('Rohan Verma', 2);      -- Rohan reports to Diya

SELECT 
    e1.employee_name AS employee_name,
    e2.employee_name AS manager_name
FROM 
    employes e1
LEFT JOIN 
    employes e2 ON e1.manager_id = e2.employee_id;
    
# CROSS JOIN
CREATE TABLE products1 (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL
);

CREATE TABLE customers1 (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_name VARCHAR(100) NOT NULL
);

#Inserting sample data into the products table
INSERT INTO products1 (product_name) VALUES
('Laptop'),
('Smartphone'),
('Tablet'),
('Headphones'),
('Smartwatch');

#Inserting sample data into the customers table
INSERT INTO customers1 (customer_name) VALUES
('Aarav Sharma'),
('Diya Patel'),
('Kabir Khan'),
('Isha Gupta'),
('Rohan Verma');

SELECT 
    p.product_name, 
    c.customer_name
FROM 
    products p
CROSS JOIN 
    customers c;
    
    # NATURAL JOIN 
    CREATE TABLE orders1 (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);
-- Inserting sample data into the orders table
INSERT INTO orders1 (customer_id, order_date) VALUES
(1, '2023-10-01'),
(2, '2023-10-02'),
(1, '2023-10-03'),
(3, '2023-10-04'),
(2, '2023-10-05');

SELECT *
FROM customers1
NATURAL JOIN orders1;

# JOIN WITH AGGREGATIION 
CREATE TABLE orders2 (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    product_id INT,
    FOREIGN KEY (customer_id) REFERENCES customers1(customer_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);
INSERT INTO orders2 (customer_id, product_id) VALUES
(1, 2),  #Customer 1 ordered Product 2
(2, 3),  #Customer 2 ordered Product 3
(1, 1),  #Customer 1 ordered Product 1
(3, 5),  #Customer 3 ordered Product 5
(2, 4);  #Customer 2 ordered Product 4

SELECT 
    c.customer_name,
    COUNT(o.product_id) AS total_products_ordered
FROM 
    customers1 c
LEFT JOIN 
    orders2 o ON c.customer_id = o.customer_id
GROUP BY 
    c.customer_name;
    
# MULTIPLE JOINS
CREATE TABLE customers2 (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_name VARCHAR(100) NOT NULL
);

CREATE TABLE products2 (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL
);

CREATE TABLE orders3 (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    product_id INT,
    order_date DATE,
    FOREIGN KEY (customer_id) REFERENCES customers2(customer_id),
    FOREIGN KEY (product_id) REFERENCES products2(product_id)
);
-- Inserting sample data into customers2
INSERT INTO customers2 (customer_name) VALUES
('Aarav Sharma'),
('Diya Patel'),
('Kabir Khan');

-- Inserting sample data into products2
INSERT INTO products2 (product_name) VALUES
('Laptop'),
('Smartphone'),
('Tablet');

-- Inserting sample data into orders3
INSERT INTO orders3 (customer_id, product_id, order_date) VALUES
(1, 1, '2023-10-01'),  #Aarav ordered Laptop
(2, 2, '2023-10-02'),  #Diya ordered Smartphone
(1, 3, '2023-10-03');  #Aarav ordered Tablet

SELECT 
    c.customer_name,
    p.product_name,
    o.order_date
FROM 
    orders3 o
JOIN 
    customers2 c ON o.customer_id = c.customer_id
JOIN 
    products2 p ON o.product_id = p.product_id;
















