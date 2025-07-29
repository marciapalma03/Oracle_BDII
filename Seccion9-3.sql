--Ejemplos de operadores
SELECT hire_date, employee_id, job_id
FROM employees
UNION
SELECT NULL::date, employee_id, job_id
FROM job_history;

SELECT hire_date, employee_id, job_id
FROM employees
UNION
SELECT NULL::date, employee_id, job_id
FROM job_history
ORDER BY employee_id;

SELECT hire_date, employee_id, NULL::date AS start_date, NULL::date AS end_date, job_id, department_id
FROM employees
UNION
SELECT NULL::date AS hire_date, employee_id, start_date, end_date, job_id, department_id
FROM job_history
ORDER BY employee_id;