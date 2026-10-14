-- Create Database window_practice

CREATE DATABASE IF NOT EXISTS window_practice;

-- Use database window_practice

USE window_practice;

-- Create Table employees with columns as emp_id as primary key, name, department, salary, joining date

CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    name VARCHAR(50),
    department VARCHAR(50),
    salary INT,
    joining_date DATE
); 

-- Insert atleast 50 rows of data in table employees

INSERT INTO employees (emp_id, name, department, salary, joining_date)
VALUES
(1, 'Amit', 'IT', 60000, '2021-01-15'),
(2, 'Rahul', 'IT', 75000, '2020-03-12'),
(3, 'Priya', 'IT', 75000, '2022-06-18'),
(4, 'Karan', 'IT', 50000, '2023-02-10'),
(5, 'Neha', 'IT', 90000, '2019-08-21'),
(6, 'Rohit', 'IT', 65000, '2021-11-05'),
(7, 'Sneha', 'IT', 80000, '2020-09-14'),
(8, 'Vikas', 'IT', 60000, '2022-12-01'),
(9, 'Pooja', 'IT', 70000, '2023-04-17'),
(10, 'Arjun', 'IT', 85000, '2019-05-25'),
(11, 'Ravi', 'HR', 50000, '2021-02-11'),
(12, 'Anjali', 'HR', 65000, '2020-07-19'),
(13, 'Manish', 'HR', 65000, '2022-01-28'),
(14, 'Kavita', 'HR', 55000, '2023-03-15'),
(15, 'Suresh', 'HR', 80000, '2019-09-10'),
(16, 'Divya', 'HR', 70000, '2021-06-22'),
(17, 'Nitin', 'HR', 75000, '2020-11-13'),
(18, 'Riya', 'HR', 55000, '2022-08-05'),
(19, 'Akash', 'HR', 60000, '2023-01-09'),
(20, 'Meena', 'HR', 80000, '2019-12-17'),

(21, 'Vivek', 'Sales', 45000, '2022-02-14'),
(22, 'Komal', 'Sales', 60000, '2021-05-18'),
(23, 'Deepak', 'Sales', 70000, '2020-08-23'),
(24, 'Nisha', 'Sales', 70000, '2023-03-11'),
(25, 'Aman', 'Sales', 85000, '2019-04-16'),
(26, 'Swati', 'Sales', 55000, '2022-07-20'),
(27, 'Varun', 'Sales', 90000, '2020-01-08'),
(28, 'Shreya', 'Sales', 65000, '2021-10-12'),
(29, 'Mohit', 'Sales', 75000, '2023-02-25'),
(30, 'Isha', 'Sales', 60000, '2019-11-30'),
(31, 'Ramesh', 'Finance', 55000, '2021-03-15'),
(32, 'Simran', 'Finance', 75000, '2020-06-21'),
(33, 'Gaurav', 'Finance', 75000, '2022-09-18'),
(34, 'Tanya', 'Finance', 65000, '2023-01-12'),
(35, 'Harish', 'Finance', 90000, '2019-07-24'),
(36, 'Nidhi', 'Finance', 60000, '2021-12-05'),
(37, 'Varsha', 'Finance', 85000, '2020-04-17'),
(38, 'Yash', 'Finance', 65000, '2022-05-29'),
(39, 'Sonam', 'Finance', 70000, '2023-08-14'),
(40, 'Raj', 'Finance', 80000, '2019-10-09'),
(41, 'Sahil', 'Marketing', 50000, '2022-01-18'),
(42, 'Preeti', 'Marketing', 60000, '2021-04-22'),
(43, 'Abhishek', 'Marketing', 70000, '2020-09-15'),
(44, 'Muskan', 'Marketing', 70000, '2023-02-19'),
(45, 'Tarun', 'Marketing', 85000, '2019-06-11'),
(46, 'Aarti', 'Marketing', 55000, '2022-10-25'),
(47, 'Rakesh', 'Marketing', 90000, '2020-02-14'),
(48, 'Payal', 'Marketing', 65000, '2021-08-17'),
(49, 'Kunal', 'Marketing', 75000, '2023-05-23'),
(50, 'Shivani', 'Marketing', 60000, '2019-12-02'),
(51, 'Dev', 'Operations', 48000, '2022-03-10'),
(52, 'Pallavi', 'Operations', 58000, '2021-06-14'),
(53, 'Rajat', 'Operations', 68000, '2020-11-19'),
(54, 'Kirti', 'Operations', 68000, '2023-01-25'),
(55, 'Varun', 'Operations', 82000, '2019-05-13'),
(56, 'Alka', 'Operations', 52000, '2022-09-07'),
(57, 'Sameer', 'Operations', 88000, '2020-02-28'),
(58, 'Jyoti', 'Operations', 62000, '2021-10-31'),
(59, 'Naveen', 'Operations', 72000, '2023-04-09'),
(60, 'Pankaj', 'Operations', 78000, '2019-08-16');


--  Display name, salary, and the average salary of all employees using AVG() as a window function.

SELECT name, salary, AVG(salary) 
over() 
FROM employees;

--  Display name, department, salary, and the average salary of each department.

SELECT name, department, salary , AVG(salary) 
OVER(PARTITION BY department) as depart_avg 
FROM employees;

--  Display name, salary, and the total salary of all employees using SUM() as a window function.

SELECT name, department, salary , SUM(salary) 
OVER() 
FROM employees;

--  Display name, department, salary, and the total salary of their department.

SELECT name, department, salary , SUM(salary) 
OVER(PARTITION BY department) as depart_total 
FROM employees;

--  Display each employee along with the number of employees in their department.

SELECT name, department, salary , COUNT(emp_id) 
OVER(PARTITION BY department) AS no_of_employees_in_department
FROM employees;

--  Assign a row number to every employee based on salary from highest to lowest.

SELECT name, department, salary , ROW_NUMBER()
OVER(ORDER BY salary) AS salary_order
FROM employees;

--  Assign a separate row number to employees within each department, ordering salary from highest to lowest.

SELECT name, department, salary , ROW_NUMBER()
OVER(PARTITION BY department ORDER BY salary) AS salary_order_by_department
FROM employees;

--  Find the highest-paid employee from each department using ROW_NUMBER().

SELECT name, department, salary 
	FROM (
		SELECT name, 
			   department, 
               salary,
               ROW_NUMBER() OVER (
					PARTITION BY department 
                    ORDER BY salary DESC) AS rn
		FROM employees) AS t
WHERE rn=1 ;


-- Find the top 3 highest-paid employees from each department.

SELECT name, department, salary, rn AS rnk
	FROM (
		SELECT name, 
			   department, 
               salary,
               ROW_NUMBER() OVER (
					PARTITION BY department 
                    ORDER BY salary DESC) AS rn
		FROM employees) AS t
WHERE rn <=3 ;

-- 🟠 Level 3 — RANK() and DENSE_RANK()

-- Q10. Rank all employees based on salary from highest to lowest using RANK().
 
SELECT name, department, salary, joining_date, 
		RANK() OVER(
        ORDER BY salary DESC) as rnk
FROM employees;
 

-- Q11. Rank employees within each department based on salary using RANK().

SELECT name, department, salary, joining_date, 
		RANK() OVER(
        PARTITION BY department
        ORDER BY salary DESC) as rnk
FROM employees;

--  Rank employees within each department using DENSE_RANK().

SELECT name, department, salary, joining_date, 
		DENSE_RANK() OVER(
        PARTITION BY department
        ORDER BY salary DESC) as rnk
FROM employees;

--  Find the second-highest salary in each department.
--  Rank employees within each department using DENSE_RANK().

SELECT name, department, salary
FROM (
		SELECT name, department, salary,
		DENSE_RANK() OVER(
			PARTITION BY department
            ORDER BY salary DESC) as rnk
		FROM employees ) as t
WHERE rnk =2 ;

-- Q14. Find all employees who have the second-highest salary in their department.

SELECT name, department, salary
FROM (
		SELECT name, department, salary,
		DENSE_RANK() OVER(
			PARTITION BY department
            ORDER BY salary DESC) as rnk
		FROM employees ) as t
WHERE rnk = 2;


-- 🔴 Level 4 — LAG() and LEAD()

-- Q15. Display each employee's salary and the salary of the previous employee, ordered by joining date.

-- Q16. Display each employee's salary and the salary of the next employee, ordered by joining date.

-- Q17. Calculate the difference between an employee's salary and the previous employee's salary.

-- Q18. For each department, compare an employee's salary with the salary of the previous employee who joined that department.

-- 🔥 Level 5 — Interview Questions

-- Q19. Find employees whose salary is greater than their department's average salary.

SELECT name, department, salary
FROM employees 
WHERE salary > (SELECT AVG(salary)
				FROM employees);

SELECT name, department, salary
FROM (
	SELECT name, department, salary,
	AVG(salary) 
	OVER()  AS avg_sal
	FROM employees) as np
WHERE salary>avg_sal ;

-- Find the top 2 highest-paid employees in every department.

SELECT name, department, salary
FROM (
		SELECT name, department, salary,
		ROW_NUMBER() 
		OVER(PARTITION BY department 
		ORDER BY salary DESC) AS rnk
		FROM employees) AS t
WHERE rnk <=2;
         

-- Q21. Find employees who have the same salary as another employee in their department.

SELECT name , department, salary
FROM (
		SELECT name , department, salary,
		COUNT(*) 
        OVER( PARTITION BY department, salary) AS cnt
        FROM employees
        ) AS t
WHERE cnt >1;


-- Find the highest-paid employee in the entire company using a window function.

-- Q23. Find the second-highest distinct salary in the entire company.

SELECT DISTINCT SALARY 
FROM employees
ORDER BY salary DESC
LIMIT 1 OFFSET 1;

SELECT  MAX(SALARY) 
FROM employees
WHERE salary <(SELECT  MAX(salary)
			   FROM employees);


SELECT salary 
FROM(
	SELECT salary, DENSE_RANK()
    OVER( ORDER BY salary DESC) AS s
    FROM employees
    ) AS t
WHERE s = 2;

SELECT SALARY 
FROM ( 
	SELECT DISTINCT salary, ROW_NUMBER()
    OVER ( ORDER BY SALARY DESC) as s
    FROM (
    SELECT DISTINCT salary
    FROM employees) AS d)AS t
WHERE s = 2;

-- Q24. Calculate a running total of salaries within each department, ordered by joining date.

SELECT department, joining_date, salary,
SUM(salary) OVER(
            PARTITION BY department
			ORDER BY joining_date DESC
            ) AS running_sum
FROM employees;


-- Q25. Calculate the cumulative average salary within each department, ordered by joining date.

SELECT department, salary, 
AVG(salary)
		OVER(PARTITION BY department
			 ORDER BY joining_date DESC
             ) AS commulative_salary
FROM employees;

-- Q26. Find the difference between each employee's salary and the highest salary in their department.

SELECT department, salary, 
       (SELECT MAX(salary) FROM employees) - salary AS difference
FROM employees
ORDER BY department ;


SELECT department, salary , 
MAX(salary) 
	OVER(PARTITION BY department)  - salary AS diff
FROM employees;


-- Q27. Find the percentage of each employee's salary compared with their department's total salary.

SELECT department, salary,
    salary*100/SUM(salary) OVER(PARTITION BY department) AS salary_percent
FROM employees;

-- Q28. Find the department-wise employee who joined most recently.

SELECT emp_id, name, department, salary, joining_date
FROM (
     SELECT *,MAX(joining_date)
	 OVER (PARTITION BY department) as m
     FROM employees
     ) AS t
where joining_date = m;


-- Q29. Find the first employee who joined each department.

select *
FROM(
	 SELECT *, ROW_NUMBER()
	 OVER(PARTITION BY department
		 ORDER BY joining_date DESC) as rnk
         FROM employees
         ) AS t
WHERE rnk = 1;
           
-- Q30. For each department, display:

-- name
-- department
-- salary
-- department average salary
-- department rank

SELECT 
	name, 
    department, 
    salary,
	AVG(salary) 
    OVER(PARTITION BY department) AS dept_avg,
	dense_rank() 
    OVER(PARTITION BY department
	ORDER BY salary) AS dept_rnk
FROM employees;
	 

