CREATE TABLE countries
(
    country_id CHAR(2) NOT NULL,
    country_name VARCHAR(40),
    region_id INTEGER,
    CONSTRAINT country_c_id_pk PRIMARY KEY (country_id)
);

INSERT INTO countries (country_id, country_name, region_id)
VALUES ('CA', 'Canada', 2);

INSERT INTO countries (country_id, country_name, region_id)
VALUES ('DE', 'Germany', 1);

INSERT INTO countries (country_id, country_name, region_id)
VALUES ('UK', 'United Kingdom', 1);

INSERT INTO countries (country_id, country_name, region_id)
VALUES ('US', 'United States of America', 2);

CREATE TABLE departments
(
    department_id INTEGER,
    department_name VARCHAR(30) NOT NULL,
    manager_id INTEGER,
    location_id INTEGER,
    CONSTRAINT dept_id_pk PRIMARY KEY (department_id)
);

INSERT INTO departments (department_id, department_name, manager_id, location_id)
VALUES (10, 'Administration', 200, 1700);

INSERT INTO departments (department_id, department_name, manager_id, location_id)
VALUES (20, 'Marketing', 201, 1800);

INSERT INTO departments (department_id, department_name, manager_id, location_id)
VALUES (50, 'Shipping', 124, 1500);

INSERT INTO departments (department_id, department_name, manager_id, location_id)
VALUES (60, 'IT', 103, 1400);

INSERT INTO departments (department_id, department_name, manager_id, location_id)
VALUES (80, 'Sales', 149, 2500);

INSERT INTO departments (department_id, department_name, manager_id, location_id)
VALUES (90, 'Executive', 100, 1700);

INSERT INTO departments (department_id, department_name, manager_id, location_id)
VALUES (110, 'Accounting', 205, 1700);

INSERT INTO departments (department_id, department_name, manager_id, location_id)
VALUES (190, 'Contracting', NULL, 1700);

--Sentencia SELECT basica
SELECT department_name 
FROM departments;