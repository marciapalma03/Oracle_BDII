--Sentencia SELECT
SELECT last_name
FROM employees;

--Seleccion de todas las columnas 
SELECT *
FROM countries;

SELECT country_id, country_name, region_id
FROM countries;

CREATE TABLE locations 
(
    location_id INTEGER,
    street_address VARCHAR(40),
    postal_code VARCHAR(12),
    city VARCHAR(30) NOT NULL,
    state_province VARCHAR(25),
    country_id CHAR(2),
    CONSTRAINT loc_id_pk PRIMARY KEY (location_id)
);

INSERT INTO locations (location_id, street_address, postal_code, city, state_province, country_id)
VALUES (1800, '460 Bloor St. W.', 'ON M5S 1X8', 'Toronto', 'Ontario', 'CA');

INSERT INTO locations (location_id, street_address, postal_code, city, state_province, country_id)
VALUES (2500, 'Magdalen Centre, The Oxford Science Park', 'OX9 9ZB', 'Oxford', 'Oxford', 'UK');

INSERT INTO locations (location_id, street_address, postal_code, city, state_province, country_id)
VALUES (1400, '2014 Jabberwocky Rd', '26192', 'Southlake', 'Texas', 'US');

INSERT INTO locations (location_id, street_address, postal_code, city, state_province, country_id)
VALUES (1500, '2011 Interiors Blvd', '99236', 'South San Francisco', 'California', 'US');

INSERT INTO locations (location_id, street_address, postal_code, city, state_province, country_id)
VALUES (1700, '2004 Charade Rd', '98199', 'Seattle', 'Washington', 'US');

--Seleccion de columnas en concreto 
SELECT location_id, city, state_province
FROM locations;

--Uso de operadores aritmeticos
SELECT last_name, salary,
salary + 300 AS adjusted_salary
FROM employees;

--Prioridades con los operadores aritmeticos
SELECT last_name, salary,
12 * salary + 100 AS salary_bonus
FROM employees;

SELECT last_name, salary,
12 * (salary + 100) AS yearly_salary
FROM employees;

--Valores NULL
SELECT last_name, job_id, salary, commission_pct,
salary * commission_pct AS commission_amount
FROM employees;

--Uso de alias de columnas 
SELECT last_name AS name,
commission_pct AS comm 
FROM employees;

SELECT last_name "Name",
salary * 12 "Annual Salary"
FROM employees;