--Creacion de indices
CREATE INDEX wf_cont_reg_id_idx
ON wf_countries(region_id);

CREATE INDEX emps_name_idx
ON employees(first_name, last_name);

SELECT 
i.relname AS index_name,
a.attname AS column_name,
(k.n + 1) AS column_position,
CASE
    WHEN ix.indisunique THEN 'UNIQUE'
    ELSE 'NONUNIQUE'
END AS uniqueness
FROM pg_class t
JOIN pg_index ix ON t.oid = ix.indrelid
JOIN pg_class i ON i.oid = ix.indexrelid
JOIN LATERAL unnest(ix.indkey) WITH ORDINALITY AS k(attnum, n) ON true
JOIN pg_attribute a ON a.attnum = k.attnum AND a.attrelid = t.oid
WHERE t.relname = 'employees'
ORDER BY index_name, column_position;

CREATE INDEX upper_last_name_idx
ON employees (UPPER(last_name));

SELECT * 
FROM employees
WHERE UPPER(last_name) = 'KING';

SELECT * 
FROM employees
WHERE UPPER(last_name) LIKE 'KIN%';

SELECT *
FROM employees
WHERE UPPER(last_name) IS NOT NULL
ORDER BY UPPER(last_name);

SELECT first_name, last_name, hire_date
FROM employees
WHERE TO_CHAR(hire_date, 'YYYY') = '1987';

CREATE INDEX emp_hiredate_idx ON employees (hire_date);
SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date >= DATE '1987-01-01' AND hire_date <  DATE '1988-01-01';

SELECT first_name, last_name, hire_date
FROM employees
WHERE TO_CHAR(hire_date, 'YYYY') = '1987';

DROP INDEX upper_last_name_idx;
DROP INDEX emps_name_idx;

CREATE TABLE amy_copy_employees 
(
  employee_id INTEGER PRIMARY KEY,
  first_name  VARCHAR(50),
  last_name   VARCHAR(50)
);

CREATE OR REPLACE VIEW amy_emps AS
SELECT * FROM amy_copy_employees;

DROP VIEW amy_emps;