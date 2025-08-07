--Comando ALTER
ALTER TABLE my_friends
ADD favorite_game VARCHAR(30);

CREATE TABLE mod_emp 
(
    last_name VARCHAR(20),
    salary NUMERIC(8,2)
);

ALTER TABLE mod_emp
ALTER COLUMN last_name TYPE VARCHAR(30);

ALTER TABLE mod_emp
ALTER COLUMN last_name TYPE VARCHAR(10);

ALTER TABLE mod_emp
ALTER COLUMN salary TYPE NUMERIC(10,2);

ALTER TABLE mod_emp
ALTER COLUMN salary TYPE NUMERIC(8,2);

ALTER TABLE mod_emp
ALTER COLUMN salary SET DEFAULT 50;

ALTER TABLE my_friends
DROP COLUMN favorite_game;

ALTER TABLE copy_employees
DROP COLUMN email;

--Comando DROP
DROP TABLE copy_employees;

--Comando RENAME
ALTER TABLE my_friends
RENAME TO friends;

--Comando COMMENT
COMMENT ON TABLE employees
IS 'Western Region only';

SELECT c.relname AS table_name, d.description AS comments
FROM pg_class c
JOIN pg_namespace n ON n.oid = c.relnamespace
LEFT JOIN pg_description d ON d.objoid = c.oid AND d.objsubid = 0
WHERE c.relkind = 'r' AND n.nspname = 'public'; 

COMMENT ON TABLE employees IS NULL;

CREATE TABLE employees_history 
(
    employee_id INT,
    first_name TEXT,
    last_name TEXT,
    operation TEXT,
    start_time TIMESTAMP,
    end_time TIMESTAMP,
    salary NUMERIC(10,2)
);

INSERT INTO employees_history 
(
    employee_id, first_name, last_name, operation, start_time, end_time, salary
)
VALUES
(1, 'John', 'Doe', 'INSERT', '2023-01-01 08:00:00', '2023-06-01 12:00:00', 3000.00),
(1, 'John', 'Doe', 'UPDATE', '2023-06-01 12:00:00', '2024-02-15 10:00:00', 3500.00),
(1, 'John', 'Doe', 'UPDATE', '2024-02-15 10:00:00', NULL, 4000.00);

SELECT employee_id, first_name || ' ' || last_name AS "NAME", operation AS "OPERATION", start_time AS "START_DATE", end_time AS "END_DATE", salary
FROM employees_history
WHERE employee_id = 1;

UPDATE employees_history
SET salary = 1
WHERE employee_id = 1;

DELETE FROM employees_history
WHERE employee_id = 1;

SELECT employee_id, salary
FROM employees_history
WHERE employee_id = 1;