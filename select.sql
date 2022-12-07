--1
SELECT
	first_name 	AS "First Name", 
	last_name	AS "Last Name"
FROM employees;
	
--2
SELECT DISTINCT department_id
FROM employees;

--3
SELECT *
FROM employees
ORDER BY first_name DESC;

--4
SELECT 
	first_name, last_name, salary, 15% * salary AS "PF"
FROM employees;

--5
SELECT
	employee_id, first_name, last_name, salary
FROM employees
ORDER BY salary;

--6
SELECT SUM(salary)
FROM employees;

--7
SELECT
	MIN(salary) AS "Minimum Salary",
	MAX(salary) AS "Maximum Salary"
FROM employees;
	
--8
SELECT
	AVG(salary) 				AS "Average Salary"
	COUNT(DISTINCT employee_id) AS "Number of Employees"
FROM employees;
	
--9
SELECT 
--10
SELECT COUNT(DISTINCT job_id) AS "Number of Jobs"
FROM employees;

--11
SELECT UPPER (first_name)
FROM employees;

--12
SELECT SUBSTRING(first_name, 1, 3)
FROM employees;

--13
SELECT 171*214+625;

--14
SELECT CONCAT(first_name, ' ', last_name) AS "Full Name"
FROM employees;

--15
SELECT TRIM(first_name)
FROM employees;

--16
SELECT LENGTH(TRIM(first_name)) + LENGTH(TRIM(last_name)) AS "Name Length"
FROM employees;

--17
SELECT * 
FROM employees 
WHERE first_name LIKE '%[0-9]%';

--18
SELECT *
FROM employees
LIMIT 10;

--19
SELECT ROUND(salary/12, 2) AS "Monthly Salary"
FROM employees;