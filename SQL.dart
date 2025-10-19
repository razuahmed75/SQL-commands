Database Commands----------------------------------
-- Create a new database
CREATE DATABASE my_database;

-- Use / select a database
USE my_database;

-- Delete a database
DROP DATABASE my_database;

-- Show all databases
SHOW DATABASES;


Table Commands----------------------------------
-- Create a new table
CREATE TABLE employees (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    position VARCHAR(50),
    salary DECIMAL(10, 2),
    hire_date DATE
);

-- View all tables in the current database
SHOW TABLES;

-- Describe table structure
DESCRIBE employees;

-- Rename a table
RENAME TABLE employees TO staff;

-- Delete (drop) a table
DROP TABLE employees;

-- Modify table structure
ALTER TABLE employees ADD COLUMN department VARCHAR(50);
ALTER TABLE employees DROP COLUMN department;
ALTER TABLE employees MODIFY salary DECIMAL(12, 2);

Data Manipulation Commands----------------------------------
-- Insert data into a table
INSERT INTO employees (name, position, salary, hire_date)
VALUES ('John Doe', 'Manager', 75000.00, '2023-05-10');

-- Insert multiple rows
INSERT INTO employees (name, position, salary, hire_date)
VALUES 
('Alice', 'Developer', 60000.00, '2023-01-15'),
('Bob', 'Designer', 55000.00, '2023-03-22');

-- Retrieve (select) data
SELECT * FROM employees;
SELECT name, salary FROM employees WHERE position = 'Manager';

-- Update data
UPDATE employees
SET salary = 80000.00
WHERE name = 'John Doe';

-- Delete data
DELETE FROM employees WHERE name = 'Alice';

Query Filters & Clauses----------------------------------
-- Filtering rows
SELECT * FROM employees WHERE salary > 60000;

-- Sorting
SELECT * FROM employees ORDER BY salary DESC;

-- Limiting results
SELECT * FROM employees LIMIT 5;

-- Pattern matching
SELECT * FROM employees WHERE name LIKE 'A%';  -- names starting with A

-- Combining conditions
SELECT * FROM employees WHERE salary > 50000 AND position = 'Developer';

-- Grouping and aggregation
SELECT position, AVG(salary) AS avg_salary
FROM employees
GROUP BY position
HAVING avg_salary > 50000;

Table Relationships----------------------------------
-- Create table with a foreign key
CREATE TABLE departments (
    dept_id INT PRIMARY KEY AUTO_INCREMENT,
    dept_name VARCHAR(50)
);

CREATE TABLE employees (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES departments(dept_id)
);


