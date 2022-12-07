--1
CREATE TABLE countries(
	country_id 		char(2),
	country_name 	varchar(40),
	region_id 		int
);

--2
CREATE TABLE IF NOT EXISTS countries(
	country_id 		char(2),
	country_name 	varchar(40),
	region_id 		int
);

--3
CREATE TABLE dup_countries AS (SELECT * FROM countries) WITH NO DATA;

--4
CREATE TABLE IF NOT EXISTS dup_countries AS (SELECT * FROM countries);

--5
CREATE TABLE IF NOT EXISTS countries(
	country_id char(2) IS NULL,
	country_name varchar(40) IS NULL,
	region_id int IS NULL
);

--6
CREATE TABLE IF NOT EXISTS jobs(
	job_id varchar(10),
	job_title varchar(35),
	min_salary int,
	max_salary int,
	CHECK (max_salary <= 25000)
); 

--7
CREATE TABLE IF NOT EXISTS countries(
	country_id char(2),
	country_name varchar(40),
	region_id int,
	CHECK (country_name LIKE '%Italy%' OR '%India%' OR '%China%')
);

--8
CREATE TABLE IF NOT EXISTS job_history(
	employee_id int,
	start_date date,
	end_date date,
	job_id varchar(10),
	department_id int
);

--9
CREATE TABLE IF NOT EXISTS countries(
	country_id char(2) NOT NULL,
	country_name varchar(40),
	region_id int,
	PRIMARY KEY (country_id)
);

--10
CREATE TABLE jobs(
	job_id varchar(10),
	job_title varchar(35) DEFAULT 'blank',
	min_salary int DEFAULT 8000,
	max_salary int DEFAULT NULL,
	CHECK (max_salary <= 25000)
);


--11
CREATE TABLE IF NOT EXISTS countries(
	country_id char(2),
	country_name varchar(40),
	region_id int,
	PRIMARY KEY (country_id)
);

--12
CREATE TABLE IF NOT EXISTS countries(
	country_id SERIAL PRIMARY KEY,
	country_name varchar(40),
	region_id int
);

--14
CREATE TABLE IF NOT EXISTS job_history(
	employee_id int,
	start_date date,
	end_date date,
	job_id varchar(10),
	department_id int,
	PRIMARY KEY (employee_id),
	FOREIGN KEY (job_id) REFERENCES jobs(job_id)
);

--15
CREATE TABLE IF NOT EXISTS departments(
	department_id int NOT NULL UNIQUE,
	deparment_name varchar(30),
	manager_id int NOT NULL UNIQUE,
	location_id int NOT NULL
	--FOREIGN KEY (manager_id) REFERENCES employees(employee_id)
);
CREATE TABLE IF NOT EXISTS employees(
	employee_id int PRIMARY KEY,
	first_name varchar(30),
	last_name varchar(30),
	email varchar(30),
	phone_number varchar(20),
	hire_date date,
	job_id varchar(10),
	salary int,
	commission int,
	manager_id int,
	department_id int,
	FOREIGN KEY (department_id) REFERENCES departments(department_id),
	FOREIGN KEY (manager_id) REFERENCES employees(employee_id)
);

--16
CREATE TABLE IF NOT EXISTS employees(
	employee_id int,
	first_name varchar(30),
	last_name varchar(30),
	email varchar(30),
	phone_number varchar(20),
	hire_date date,
	job_id varchar(10),
	salary int,
	commission int,
	manager_id int,
	department_id int,
	PRIMARY KEY (employee_id),
	FOREIGN KEY (department_id) REFERENCES departments(department_id),
	FOREIGN KEY (job_id) REFERENCES jobs(job_id)
);

--17
CREATE TABLE IF NOT EXISTS employees(
	employee_id int PRIMARY KEY,
	first_name varchar(30),
	last_name varchar(30),
	job_id varchar(10),
	salary int,
	department_id int,
	FOREIGN KEY (job_id) REFERENCES jobs(job_id) ON UPDATE CASCADE
);

--18
CREATE TABLE IF NOT EXISTS employees(
	employee_id int PRIMARY KEY,
	first_name varchar(30),
	last_name varchar(30),
	job_id varchar(10),
	salary int,
	FOREIGN KEY (job_id) REFERENCES jobs(job_id) ON DELETE CASCADE
);

--19
CREATE TABLE IF NOT EXISTS employees(
	employee_id int PRIMARY KEY,
	first_name varchar(30),
	last_name varchar(30),
	job_id varchar(10),
	salary int,
	FOREIGN KEY (job_id) REFERENCES jobs(job_id) ON DELETE SET NULL
);