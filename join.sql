--1
SELECT 
	(location_id, street_address, city, state_province, country_name)
FROM
	locations
INNER JOIN departments 	ON departments.location_id = locations.location_id
INNER JOIN countries 	ON countries.country_id = locations.country_id;

--2
SELECT 
	(first_name, last_name, department_id)
FROM employees;

--3
SELECT 
	(first_name, last_name, jobs.job_title, department_id)
FROM employees
	INNER JOIN jobs 		ON jobs.job_id = employees.job_id
	INNER JOIN departments 	ON departments.department_id = employees.department_id
WHERE departments.location_id LIKE '%London%';

--4
SELECT
	(employee.employee_id, employee.last_name, manager.employee_id, manager.last_name)
FROM 
	(employees AS employee, employees AS manager)
WHERE
	employee.manager_id = manager.employee_id;
	
--5
SELECT
	(first_name, last_name, hire_date)
FROM employees
WHERE hire_date > 
(
	SELECT hire_date
	FROM employees
	WHERE last_name LIKE '%Jones%'
);

--6
SELECT
	department_name, 
	COUNT(*) AS "Number of Employees in the Department"
FROM 
	departments INNER JOIN employees ON departments.department_id = employees.department_id
GROUP BY department_name;

--7
SELECT
	(employee_id, job_title, end_date - start_date AS 'Days worked')
FROM
	employees
	LEFT JOIN job_history 	ON job_history.department_id = employees.department_id
	LEFT JOIN jobs 			ON jobs.job_id = employees.job_id,
WHERE 
	department_id = 90;
	
--8
SELECT
	(manager.department_id, manager.last_name, manager.first_name)
FROM 
	employees AS employee, employees AS manager
WHERE 
	employee.manager_id = manager.employee_id;
	
--9
SELECT 
	(department_name, manager.last_name, manager.first_name, city)
FROM
	employees AS employee,
	employees AS manager,
	departments 
		LEFT JOIN employees ON employees.department_id = departments.department_id
		LEFT JOIN locations ON locations.location_id = departments.location_id;
				
--10
SELECT 
	(job_title, AVG(salary))
FROM jobs
	LEFT JOIN employees ON jobs.job_id = employees.job_id
GROUP BY job_title;

--11
SELECT
	job_title, 
	first_name || ' ' || last_name 		AS "Name", 
	employees.salary - jobs.min_salary 	AS "Salary difference"
FROM jobs
	LEFT JOIN employees ON jobs.job_id = employees.job_id
GROUP BY job_title;

--12
SELECT *
FROM job_history
	INNER JOIN employees ON job_history.employee_id = employees.employee_id
WHERE salary > 10000;

--13
--("Manager" here means the manager of the department, not the manager of the employees)
SELECT
	department_name					AS "Department", 
	first_name || ' ' || last_name 	AS "Name", 
	hire_date						AS "Hire date",
	salary							AS "Salary"
FROM 
	employees RIGHT JOIN departments ON employees.department_id = departments.department_id,
	employees LEFT JOIN job_history ON employees.employee_id = job_history.employee_id
WHERE 
	end_date - start_date 
