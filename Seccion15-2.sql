--Comando VIEW
CREATE VIEW view_dept50 AS
SELECT department_id, employee_id, first_name, last_name, salary
FROM copy_employees
WHERE department_id = 50;

SELECT * FROM view_dept50;

UPDATE view_dept50
SET department_id = 90
WHERE employee_id = 124;

DROP VIEW IF EXISTS view_dept50;

CREATE OR REPLACE VIEW view_dept50 AS
SELECT department_id, employee_id, first_name, last_name, salary
FROM employees
WHERE department_id = 50
WITH CHECK OPTION;