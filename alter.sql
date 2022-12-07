--1
RENAME TABLE countries TO country_new;

--2
ALTER TABLE locations
ADD COLUMN region_id int;

--3
/*	PostgreSQL currently defines column order based on the attnum column of the pg_attribute table. 
	The only way to change column order is either by recreating the table, 
	or by adding columns and rotating data until you reach the desired layout.
*/
ALTER TABLE locations
ADD COLUMN location_id int;

SELECT
	(location_id, street_address, postal_code, city, state_province, country_id)
INTO new_locations
FROM locations;

DROP TABLE locations;
RENAME TABLE new_locations AS locations;

--4
ALTER TABLE locations
ADD COLUMN region_id char(10);

SELECT
	(location_id, street_address, postal_code, city, state_province, region_id, country_id)
INTO new_locations
FROM locations;

DROP TABLE locations;
RENAME TABLE new_locations AS locations;

--5
ALTER TABLE locations
ALTER COLUMN country_id int;

--6
ALTER TABLE locations
DROP COLUMN city;

--7
ALTER TABLE locations
RENAME COLUMN state_province TO state;

--8
ALTER TABLE locations
ADD PRIMARY KEY (location_id);

--9
ALTER TABLE locations
ADD PRIMARY KEY (location_id, country_id);

--10
ALTER TABLE locations
DROP PRIMARY KEY (location_id, country_id);

--11
ALTER TABLE job_history
ADD FOREIGN KEY (job_id) REFERENCES jobs(job_id);

--12
ALTER TABLE job_history
CONSTRAINT fk_job_id ADD FOREIGN KEY (job_id) REFERENCES jobs(job_id);

--13
ALTER TABLE job_history
DROP CONSTRAINT (fk_job_id);

--14
CREATE INDEX indx_job_id
ON job_history(job_id);

--15
DROP INDEX IF EXISTS indx_job_id;