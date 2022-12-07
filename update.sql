--1
UPDATE employees 
SET email = 'not available';

--2
UPDATE employees
SET 
	email = 'not available',
	commission_pct = 0.10;

--3
UPDATE employees
SET 
	email = 'not available',
	commission_pct = 0.10
WHERE department_id = 110;

--4
UPDATE employees
SET email = 'not available'
WHERE 
	department_id = 80 AND commision_pct < 0.20;
	
--5
UPDATE employees
SET email = 'not available'
WHERE department_id IN(
	SELECT department_id
	FROM departments, employees
	WHERE 
		employees.department_id = departments.department_id AND
		department_name = 'Accounting'
);

--6
UPDATE employees
SET salary = 8000
WHERE employee_id = 105 AND salary < 5000;

--7
UPDATE employees
SET job_id = 'SH_CLERK'
WHERE department_id = 30 AND SUBSTRING(job_id, 1, 2) NOT LIKE 'SH';

--8
/* Multiple updates with CASE is available but not recommended. */
UPDATE employees
SET salary = salary * 1.25 
WHERE department_id = 40;

UPDATE employees
SET salary = salary * 1.15 
WHERE department_id = 90;

UPDATE employees
SET salary = salary * 1.10 
WHERE department_id = 110;

--9
UPDATE jobs
SET 
	min_salary = min_salary + 2000,
	max_salary = max_salary + 2000
WHERE job_id = 'PU_CLERK';

UPDATE employees
SET 
	salary = salary * 1.20,
	commission = commission * 1.10;
WHERE job_id = 'PU_CLERK';