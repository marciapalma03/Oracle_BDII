CREATE TABLE emp AS
SELECT * 
FROM employees;

CREATE TABLE dept AS
SELECT *
FROM departments;

WITH
keyed AS 
(
    SELECT
    tc.constraint_name,
    tc.constraint_type,
    kcu.column_name,
    kcu.ordinal_position AS column_position
    FROM information_schema.table_constraints tc
    JOIN information_schema.key_column_usage kcu
    ON  kcu.constraint_catalog = tc.constraint_catalog
    AND kcu.constraint_schema  = tc.constraint_schema
    AND kcu.constraint_name    = tc.constraint_name
    AND kcu.table_schema       = tc.table_schema
    AND kcu.table_name         = tc.table_name
    WHERE tc.table_schema = 'public'
    AND tc.table_name  = 'job_history'
    AND tc.constraint_type IN ('PRIMARY KEY','FOREIGN KEY','UNIQUE')
),
notnulls AS 
(
    SELECT
    ('nn_' || c.table_name || '_' || c.column_name) AS constraint_name,
    'NOT NULL'        AS constraint_type,
    c.column_name,
    c.ordinal_position AS column_position
    FROM information_schema.columns c
    WHERE c.table_schema = 'public'
    AND c.table_name  = 'job_history'
    AND c.is_nullable = 'NO'
)
SELECT *
FROM keyed
UNION ALL
SELECT *
FROM notnulls
ORDER BY column_position, constraint_type, constraint_name;

ALTER TABLE emp ALTER COLUMN department_id DROP NOT NULL;

SELECT DISTINCT e.department_id
FROM emp e
LEFT JOIN dept d ON e.department_id = d.department_id
WHERE d.department_id IS NULL;

UPDATE emp
SET department_id = NULL
WHERE department_id NOT IN (SELECT department_id FROM dept);

ALTER TABLE emp
ADD CONSTRAINT emp_dept_fk
FOREIGN KEY (department_id)
REFERENCES dept (department_id)
ON DELETE SET NULL;

SELECT COUNT(*) AS "Num emps"
FROM emp;

DELETE FROM dept
WHERE department_id = 10;

SELECT e.last_name, e.salary, e.department_id, dept_avg.avg_salary
FROM employees e
JOIN 
(
    SELECT department_id, AVG(salary) AS avg_salary
    FROM employees
    GROUP BY department_id
) 
dept_avg
ON e.department_id = dept_avg.department_id
WHERE e.salary > dept_avg.avg_salary
ORDER BY e.department_id, e.salary DESC;

CREATE OR REPLACE VIEW v2 AS
SELECT d.department_name, MAX(e.salary) AS highest_salary, MIN(e.salary) AS lowest_salary, ROUND(AVG(e.salary), 2) AS average_salary
FROM employees e
JOIN departments d ON e.department_id = d.department_id
GROUP BY d.department_name;

SELECT *
FROM v2;

CREATE OR REPLACE VIEW dept_managers_view AS
SELECT d.department_name, UPPER(SUBSTRING(e.first_name FROM 1 FOR 1)) || '.' AS manager_initials, e.last_name AS manager_last_name
FROM departments d
JOIN employees   e ON e.employee_id = d.manager_id;

SELECT * 
FROM dept_managers_view;

CREATE OR REPLACE FUNCTION prevent_mod_dept_managers_view()
RETURNS trigger AS $$
BEGIN
RAISE EXCEPTION 'dept_managers_view es de solo lectura';
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER dept_managers_view_readonly
INSTEAD OF INSERT OR UPDATE OR DELETE ON dept_managers_view
FOR EACH ROW EXECUTE FUNCTION prevent_mod_dept_managers_view();

UPDATE dept_managers_view
SET manager_last_name = manager_last_name;

DROP VIEW IF EXISTS v3;

CREATE SEQUENCE ct_seq;

SELECT nextval('ct_seq') AS next_number;

SELECT nextval('ct_seq') AS current_number;

INSERT INTO dept (department_id, department_name, location_id)
VALUES (10, 'IT Department', 1700);

INSERT INTO emp 
(employee_id, first_name, last_name, email, phone_number, 
 hire_date, job_id, salary, commission_pct, manager_id, department_id)
VALUES
(nextval('ct_seq'), 'Kaare', 'Hansen', 'KHANSEN', '4496583212',
 CURRENT_DATE, 'Manager', 6500, NULL, 100, 10);

CREATE INDEX emp_indx
ON emp 
(
    employee_id DESC,
    UPPER(SUBSTRING(first_name FROM 1 FOR 1) || ' ' || last_name)
);

SELECT table_schema, table_name
FROM information_schema.tables
WHERE table_type = 'BASE TABLE'
AND table_schema = 'public'
AND table_name ILIKE '%priv%';

GRANT SELECT ON emp TO PUBLIC;

SELECT grantee, table_schema, table_name, privilege_type
FROM information_schema.role_table_grants
WHERE table_name = 'emp' AND privilege_type = 'SELECT';

SELECT e.employee_id, d.department_name
FROM employees e
CROSS JOIN departments d;

SELECT e.employee_id, d.department_name
FROM employees e
JOIN departments d
ON e.department_id = d.department_id;

SELECT e.last_name, d.department_name, e.salary, c.country_name
FROM employees e
LEFT JOIN departments d  ON e.department_id = d.department_id
LEFT JOIN locations   l  ON d.location_id   = l.location_id
LEFT JOIN countries   c  ON l.country_id    = c.country_id;

SELECT e.last_name, d.department_name, e.salary, c.country_name
FROM employees e
LEFT JOIN departments d  ON e.department_id = d.department_id
LEFT JOIN locations   l  ON d.location_id   = l.location_id
LEFT JOIN countries   c  ON l.country_id    = c.country_id
WHERE e.last_name = 'Grant' OR e.department_id IS NOT NULL;