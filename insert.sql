--1 
INSERT INTO countries
	(country_id, country_name, region_id)
VALUES
	('AF', 'Afghanistan', 1);
	
--2
INSERT INTO countries
	(country_id, country_name)
VALUES
	('ES', 'Spain');
	
--3
CREATE TABLE country_new AS SELECT * FROM countries;

--4
INSERT INTO countries
	(region_id)
VALUES
	(NULL);

--5
INSERT INTO countries
	(country_id, country_name, region_id)
VALUES
	('AF', 'Afghanistan', 1),
	('SQ', 'Serbia', 2),
	('SG', 'Singapore', 3);
	
--6
INSERT INTO country_new
	(country_id, country_name, region_id)
VALUES
	('COOO1', 'India', 1001),
	('C0002', 'USA', 1007),
	('C0003', 'UK', 1003);
	
INSERT INTO countries
SELECT * FROM country_new;

--7
INSERT INTO jobs
	(job_id, job_title, min_salary, max_salary)
VALUES
	('TL', 'Tech Lead', 10000, 25000),
	('BA', 'Business Analyst', 8000, 22000),
	('DV', 'Fullstack Developer', 15000, 23000);

--10
ALTER TABLE countries
ALTER COLUMN country_id int PRIMARY KEY NOT NULL SERIAL;
INSERT INTO countries
	(country_name, region_id)
VALUES
	('Afghanistan', 1),
	('Serbia', 2),
	('Singapore', 3),
	('Vietnam', 4),
	('China', 5);
	
--11
ALTER TABLE countries ALTER COLUMN country_id SERIAL PRIMARY KEY NOT NULL;
ALTER TABLE countries ALTER COLUMN country_name varchar(40) DEFAULT 'N/A';

INSERT INTO countries
	(country_name, region_id)
VALUES
	('Korea', 32),
	('Japan', 13),
	('Laos', 31),
	('Bruney', 43),
	('Sweeden', 15);

--12
INSERT INTO job_history
	(employee_id, start_date, end_date, job_id, department_id)
SELECT
	()
WHERE EXISTS(
	SELECT *
	FROM jobs
	WHERE jobs.job_id = 
)
--13
INSERT INTO employees

--14
INSERT INTO employees