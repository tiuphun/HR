--DROP
DROP TABLE regions;
DROP TABLE departments;
DROP TABLE job_history;
DROP TABLE countries;
DROP TABLE employees;
DROP TABLE locations;
DROP TABLE jobs;
DROP TABLE job_grades;

--CREATE
CREATE TABLE IF NOT EXISTS regions(
	region_id 		int PRIMARY KEY,
	region_name 	varchar(25)
);

CREATE TABLE IF NOT EXISTS departments(
	department_id 	int PRIMARY KEY,
	department_name varchar(20),
	manager_id 		int,
	location_id 	int
);

CREATE TABLE IF NOT EXISTS job_history(
	employee_id 	int,
	start_date		date,
	end_date		date,
	job_id			varchar(10),
	department_id	int,
	PRIMARY KEY (employee_id, start_date)
);

CREATE TABLE IF NOT EXISTS countries(
	country_id		char(2) PRIMARY KEY,
	country_name	varchar(40),
	region_id		int
);

CREATE TABLE IF NOT EXISTS employees(
	employee_id int PRIMARY KEY,
	first_name varchar(50),
	last_name varchar(50),
	email varchar(100),
	phone_number varchar(50),
	hire_date date,
	job_id varchar(20),
	salary int,
	commission int,
	manager_id int,
	department_id int,
	FOREIGN KEY (department_id) REFERENCES departments(department_id),
	FOREIGN KEY (manager_id) REFERENCES employees(employee_id)
);

CREATE TABLE IF NOT EXISTS locations(
	location_id int PRIMARY KEY,
	street_address 	varchar(25),
	postal_code 	varchar(25),
	city 			varchar(30),
	state_province 	varchar(12),
	country_id 		char(2)
);

CREATE TABLE IF NOT EXISTS jobs(
	job_id varchar(20) PRIMARY KEY,
	job_title varchar(50) DEFAULT 'blank',
	min_salary int,
	max_salary int
);

CREATE TABLE IF NOT EXISTS job_grades(
	grade_level 	varchar(2),
	lowest_sal		int,
	highest_sal		int
);
