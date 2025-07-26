SELECT (319/29) + 12;

--Funcion de manipulacion LOWER
SELECT last_name
FROM employees
WHERE LOWER(last_name) = 'abel';

--Funcion de manipulacion UPPER
SELECT last_name
FROM employees
WHERE UPPER(last_name) = 'ABEL';

--Funcion de manipulacion INITCAP
SELECT last_name
FROM employees
WHERE INITCAP(last_name) = 'Abel';

--Funcion de manipulacion CONCAT
SELECT CONCAT('Hello', 'World');

SELECT CONCAT(first_name, last_name)
FROM employees;

--Funcion de manipulacion SUBSTRING
SELECT SUBSTRING(last_name FROM 1 FOR 3)
FROM employees;

--Funcion de manipulacion LENGTH
SELECT LENGTH(last_name)
FROM employees;

--Funcion de manipulacion POSITION
SELECT last_name, POSITION('a' IN last_name)
FROM employees;

--Funcion de manipulacion LPAD
SELECT LPAD(last_name, 10, '*')
FROM employees;

--Funcion de manipulacion RPAD
SELECT RPAD(last_name, 10, '*')
FROM employees;

--Funcion de manipulacion TRIM
SELECT TRIM(LEADING 'a' FROM 'abcba');

SELECT TRIM(TRAILING 'a' FROM 'abcba');

SELECT TRIM(BOTH 'a' FROM 'abcba');

--Funcion de manipulacion REPLACE
SELECT REPLACE(last_name, 'a', '*')
FROM employees;

--Uso de alias 
SELECT LOWER(last_name) || LOWER(SUBSTRING(first_name, 1, 1)) AS "User Name"
FROM employees;

CREATE TABLE f_staffs 
(
    id               NUMERIC(5,0),
    first_name       VARCHAR(25) NOT NULL,
    last_name        VARCHAR(35) NOT NULL,
    birthdate        DATE NOT NULL,
    salary           NUMERIC(8,2) NOT NULL,
    overtime_rate    NUMERIC(5,2),
    training         VARCHAR(50),
    staff_type       VARCHAR(20) NOT NULL,
    manager_id       NUMERIC(5,0),
    manager_budget   NUMERIC(8,2),
    manager_target   NUMERIC(8,2),
    CONSTRAINT f_stf_id_pk PRIMARY KEY (id)
);

INSERT INTO f_staffs(id, first_name, last_name, birthdate, salary, overtime_rate, training, staff_type, manager_id, manager_budget, manager_target)
VALUES (12, 'Sue', 'Doe', TO_DATE('07-01-1980', 'MM-DD-YYYY'), 6.75, 10.25, NULL, 'Order Taker', 19, NULL, NULL);

INSERT INTO f_staffs(id, first_name, last_name, birthdate, salary, overtime_rate, training, staff_type, manager_id, manager_budget, manager_target)
VALUES (9, 'Bob', 'Miller', TO_DATE('03-19-1979', 'MM-DD-YYYY'), 10, NULL, 'Grill', 'Cook', 19, NULL, NULL);

INSERT INTO f_staffs(id, first_name, last_name, birthdate, salary, overtime_rate, training, staff_type, manager_id, manager_budget, manager_target)
VALUES (19, 'Monique', 'Tuttle', TO_DATE('03-30-1969', 'MM-DD-YYYY'), 60, NULL, NULL, 'Manager', NULL, 50000, 70000);

SELECT LOWER(last_name) || LOWER(SUBSTRING(first_name FROM 1 FOR 1))
FROM f_staffs;

SELECT first_name, last_name, salary, department_id
FROM employees
WHERE department_id = 10;