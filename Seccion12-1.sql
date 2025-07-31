--Crear copias de tablas
CREATE TABLE copy_employees AS (SELECT * FROM employees);

CREATE TABLE copy_departments AS (SELECT * FROM departments);

--Verificar las copias de las tablas 
SELECT column_name, data_type, is_nullable
FROM information_schema.columns
WHERE table_name = 'copy_employees';

SELECT * FROM copy_employees;

SELECT column_name, data_type, is_nullable
FROM information_schema.columns
WHERE table_name = 'copy_departments';

SELECT * FROM copy_departments;

--Insertar datos con INSERT
INSERT INTO copy_departments 
(department_id, department_name, manager_id, location_id)
VALUES (200, 'Human Resources', 205, 1500);

INSERT INTO copy_departments
VALUES (210, 'Estate Management', 102, 1700);

--Insertar datos nulos
INSERT INTO copy_employees
(employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary)
VALUES (302, 'Grigorz', 'Polanski', 'gpolanski', '', TO_DATE('15-Jun-2017', 'DD-Mon-YYYY'), 'IT_PROG', 4200);

--Insertar valores especiales
INSERT INTO copy_employees
(employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary)
VALUES (304, 'Test', CURRENT_USER, 't_user', '4159982010', CURRENT_DATE, 'ST_CLERK', 2500);

SELECT first_name, TO_CHAR(hire_date, 'Month, FMDD, YYYY') AS formatted_date
FROM employees
WHERE employee_id = 101;

INSERT INTO copy_employees
(employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary)
VALUES (301, 'Katie', 'Hernandez', 'khernandez', '8586667641', TO_DATE('08-Jul-2017', 'DD-Mon-YYYY'), 'MK_REP', 4200);

INSERT INTO copy_employees
(employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary)
VALUES (303, 'Angelina', 'Wright', 'awright', '4159982010', TO_TIMESTAMP('July 10, 2017 17:20', 'Month FMDD, YYYY HH24:MI'), 'MK_REP', 3600);

SELECT first_name, last_name, TO_CHAR(hire_date, 'DD-Mon-YYYY HH24:MI') AS "Date and Time"
FROM copy_employees
WHERE employee_id = 303;

CREATE TABLE sales_reps 
(
    id              INTEGER PRIMARY KEY,
    name            VARCHAR(50) NOT NULL,
    salary          NUMERIC(8,2),
    commission_pct  NUMERIC(2,2)
);

INSERT INTO sales_reps (id, name, salary, commission_pct)
VALUES (501, 'Johnson', 4500.00, 0.15);

INSERT INTO sales_reps (id, name, salary, commission_pct)
VALUES (502, 'Smith', 5200.00, 0.10);

INSERT INTO sales_reps (id, name, salary, commission_pct)
VALUES (503, 'Lopez', 3900.00, 0.20);

INSERT INTO sales_reps (id, name, salary, commission_pct)
VALUES (504, 'Brown', 6100.00, 0.12);

INSERT INTO sales_reps (id, name, salary, commission_pct)
VALUES (505, 'Taylor', 4700.00, 0.18);

INSERT INTO sales_reps (id, name, salary, commission_pct)
SELECT employee_id, last_name, salary, commission_pct
FROM employees
WHERE job_id LIKE '%REP%';

INSERT INTO sales_reps (id, name, salary, commission_pct)
SELECT employee_id, last_name, salary, commission_pct
FROM employees
ON CONFLICT (id) DO NOTHING;