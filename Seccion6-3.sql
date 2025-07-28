--Uniones externas a izquierda y derecha
SELECT e.last_name, d.department_id, d.department_name
FROM employees e
LEFT JOIN departments d ON e.department_id = d.department_id;

SELECT e.last_name, d.department_id, d.department_name
FROM employees e
RIGHT JOIN departments d ON e.department_id = d.department_id;

--Union externa completa
SELECT e.last_name, d.department_id, d.department_name
FROM employees e
FULL JOIN departments d ON e.department_id = d.department_id;

SELECT last_name, e.job_id AS "Job", jh.job_id AS "Old job", end_date
FROM employees e
LEFT JOIN job_history jh ON e.employee_id = jh.employee_id;