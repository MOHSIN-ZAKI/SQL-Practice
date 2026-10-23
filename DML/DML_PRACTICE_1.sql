CREATE DATABASE dml_practice;
USE dml_practice;

CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    name VARCHAR(50),
    department VARCHAR(30),
    salary INT,
    city VARCHAR(30)
);

INSERT INTO employees VALUES
(1, 'Aman', 'IT', 30000, 'Delhi'),
(2, 'Sara', 'HR', 25000, 'Noida'),
(3, 'Rahul', 'IT', 40000, 'Delhi'),
(4, 'Priya', 'Finance', 35000, 'Mumbai'),
(5, 'Imran', 'HR', 28000, 'Delhi'),
(6, 'Neha', 'IT', 45000, 'Noida');


-- Q1. Display all employees.

SELECT * FROM employees;

-- Q2. Display only the name and salary of every employee.

SELECT name, salary FROM employees;

-- Q3. Insert a new employee:
-- emp_id = 7, name = 'Zoya', department = 'Marketing',
-- salary = 32000, city = 'Delhi'.

INSERT INTO employees values ( 7,'Zoya','Marketing',32000,'Noida');

-- Q4. Increase Aman's salary to 33000.

UPDATE employees
SET salary = 33000
WHERE name = 'Aman';

-- Q5. Delete the employee whose emp_id is 2.

DELETE FROM employees 
WHERE emp_id = 2;

-- Q6. Display employees who work in the IT department.

SELECT * FROM employees
WHERE department = 'IT';

-- Q7. Increase every HR employee's salary by 2000.

UPDATE employees
SET salary = salary +2000
WHERE department = 'HR';

-- Q8. Delete employees whose salary is below 28000.

DELETE FROM employees 
WHERE salary < 28000;

-- Q9. Change Priya's city to Delhi.

UPDATE employees
SET city = 'Delhi'
WHERE name = 'Priya';

-- Q10. Display employees earning between 30000 and 40000, inclusive.

SELECT * FROM employees
WHERE salary BETWEEN 30000 AND 40000;

-- Q11. Change Rahul's department to Finance.

UPDATE employees 
SET department = 'Finance'
WHERE name = 'Rahul';

-- Q12. Insert two employees in a single INSERT statement:
-- (8, 'Karan', 'IT', 38000, 'Noida')
-- (9, 'Meera', 'HR', 29000, 'Mumbai').

INSERT INTO employees values (8, 'Karan', 'IT', 38000, 'Noida'),
                             (9, 'Meera', 'HR', 29000, 'Mumbai');

-- Q13. Increase the salary of all Delhi employees by 10%.

UPDATE employees
SET salary = salary * 1.2
WHERE city = 'DELHI';

-- Q14. Delete all employees working in the Marketing department.

DELETE FROM employees
WHERE department = 'Marketing';

-- Q15. Change the city of every employee earning less than 30000 to Noida.

UPDATE employees
SET city = 'Noida'
WHERE salary < 30000;

-- Q16. Display employees whose names start with 'A'.

SELECT * FROM employees 
WHERE name LIKE 'A%';

-- Q17. Display employees who do not work in the HR department.

SELECT * FROM employees
WHERE NOT department = 'HR';

SELECT * FROM employees
WHERE department <> 'HR';

-- Q18. Reduce the salary of every Finance employee by 2000.

UPDATE employees
SET salary = salary - 2000
WHERE department = 'Finance';

-- Q19. Delete employees who live in Mumbai and earn less than 36000.

DELETE FROM employees
WHERE city ='Mumbai' AND salary < 360000;

-- Q20. Display the names and salaries of employees in descending order of salary.

SELECT  * FROM employees
ORDER BY salary DESC;