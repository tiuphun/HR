--NOTE: Subqueries should always be enclosed in parentheses '()'
--1
SELECT 
	first_name || ' ' || last_name AS "Name",
	salary
FROM employees
WHERE salary > (
	SELECT salary FROM employees WHERE last_name LIKE '%Bull%'
);

--2
SELECT
	first_name || ' ' || last_name AS "Name"
FROM employees LEFT JOIN departments ON employees.department_id = departments.department_id
WHERE department_name LIKE '%IT%';

--3
SELECT
	first_name || ' ' || last_name AS "Name"
FROM 
	departments AS D1 LEFT JOIN employees ON D1.department_id = employees.department_id,
	departments AS D2 LEFT JOIN locations ON D2.location_id = locations.location_id
WHERE country_id LIKE '%US%' AND employees.manager_id IS NOT NULL;

--4
SELECT DISTINCT
	manager.first_name || ' ' || manager.last_name AS "Name"
FROM 
	employees AS employee,
	employees AS manager
WHERE employee.manager_id = manager.employee_id;
	
--5
SELECT 
	first_name || ' ' || last_name AS "Name", 
	salary
FROM employees
WHERE salary > (SELECT AVG(salary) FROM employees);

--6

--7
 
--8
--8
--10
--11
--12
--13
--14
--15
SELECT *  
FROM(
  	SELECT *, 
	ROW_NUMBER() OVER (ORDER BY employee_id) AS row_num   
    FROM employees
) AS even_records WHERE MOD(rnum, 2) = 0;

--16
SELECT 

--17
--18
--19
--20
--21
--22