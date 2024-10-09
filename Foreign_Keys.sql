CREATE DATABASE new2;
use new2;
#FOREIGN KEYS

#FOREIGN KEY DEFINITION
CREATE TABLE authors (
    author_id INT AUTO_INCREMENT PRIMARY KEY,
    author_name VARCHAR(100) NOT NULL
);
CREATE TABLE books (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    book_title VARCHAR(200) NOT NULL,
    author_id INT,
    FOREIGN KEY (author_id) REFERENCES authors(author_id)
);
#Inserting sample data into authors
INSERT INTO authors (author_name) VALUES
('J.K. Rowling'),
('George R.R. Martin'),
('J.R.R. Tolkien');

#Inserting sample data into books
INSERT INTO books (book_title, author_id) VALUES
('Harry Potter and the Philosopher\'s Stone', 1),
('A Game of Thrones', 2),
('The Hobbit', 3);

SELECT * FROM authors;
SELECT * FROM books;

#cascading deletes
CREATE TABLE categories (
    category_id INT AUTO_INCREMENT PRIMARY KEY,
    category_name VARCHAR(100) NOT NULL
);

CREATE TABLE products (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    category_id INT,
    FOREIGN KEY (category_id) REFERENCES categories(category_id) ON DELETE CASCADE
);
#inserting sample data into categories
INSERT INTO categories (category_name) VALUES
('Electronics'),
('Books'),
('Clothing');

-- Inserting sample data into products
INSERT INTO products (product_name, category_id) VALUES
('Laptop', 1),
('Smartphone', 1),
('Harry Potter', 2),
('T-shirt', 3);

SELECT * FROM categories;
SELECT * FROM products;

#Violating Foreign Key Constraint
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100)
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

INSERT INTO customers (customer_id, customer_name) VALUES
(1, 'Rajesh Kumar'),
(2, 'Lakshmi Reddy'),
(3, 'Anjali Nair'),
(4, 'Suresh Babu');

INSERT INTO orders (order_id, customer_id, order_date) VALUES
(101, 1, '2024-10-01'),
(102, 2, '2024-10-02'),
(103, 1, '2024-10-03'),
(104, 3, '2024-10-04'),
(105, 4, '2024-10-05'),
(106, 2, '2024-10-06');

INSERT INTO orders (order_id, customer_id, order_date) VALUES
(107, 1, '2024-10-07');
SELECT * FROM orders;
SELECT * FROM customers;



