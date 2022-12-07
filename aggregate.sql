--1 
SELECT COUNT(DISTINCT job_id) AS "Jobs available" FROM employees;

--2 
SELECT SUM(salary) AS "Total payable salary" FROM employees;

--3 
SELECT MIN(salary) AS "Minimum salary" FROM employees;

--4
SELECT MAX(salary) FROM employees LEFT JOIN jobs ON employees.job_id = jobs.job_id
WHERE job_title = 'Programmer';

--5
SELECT
	AVG(salary),
	COUNT(employee_id)
FROM employees
WHERE department_id = 90;

--6
SELECT
	MAX(salary) 			AS "Highest salary",
	MIN(salary)				AS "Lowest salary",
	SUM(salary)				AS "Total salary",
	ROUND(AVG(salary),2)	AS "Average salary"
FROM employees;

--7
SELECT COUNT(DISTINCT employee_id) FROM employees
GROUP BY job_id;

--8
SELECT MAX(salary) - MIN(salary) AS "Salary difference" FROM employees;

--9
SELECT
	manager.manager_id 		AS "Manager",
	MIN(employee.salary)	AS "Salary of lowest-paid employee"
FROM employees AS manager, employees AS employee
WHERE employee.manager_id = manager.manager_id
GROUP BY manager.manager_id;

--10
SELECT 
	DISTINCT departments.department_id		AS "Department",
	SUM(salary) 							AS "Total salary payable"
FROM departments LEFT JOIN employees ON departments.department_id = employees.department_id
GROUP BY departments.department_id;

--11
SELECT ROUND(AVG(salary),2)
FROM employees LEFT JOIN jobs ON employees.job_id = jobs.job_id
WHERE job_title NOT LIKE '%Programmer%'
GROUP BY employees.job_id;

--12
SELECT
	MAX(salary) 			AS "Highest salary",
	MIN(salary)				AS "Lowest salary",
	SUM(salary)				AS "Total salary",
	ROUND(AVG(salary),2)	AS "Average salary"
FROM employees
WHERE department_id = 90
GROUP BY department_id;

--13
SELECT job_id, MAX(salary)
FROM employees
WHERE job_id IN(
	SELECT job_id FROM jobs
	WHERE max_salary >= 4000
)
GROUP BY job_id;

--14
SELECT ROUND(AVG(salary),2)
FROM 
	departments LEFT JOIN employees ON departments.department_id = employees.department_id
WHERE departments.department_id IN(
	SELECT departments.department_id 
	FROM departments LEFT JOIN employees ON departments.department_id = employees.department_id
	GROUP BY departments.department_id
	HAVING COUNT(DISTINCT employee_id) > 10
);
