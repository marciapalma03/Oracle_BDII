--Consulta normal
SELECT employee_id, first_name, last_name
FROM employees;

--Consulta con clausula WHERE
SELECT employee_id, first_name, last_name
FROM employees
WHERE employee_id = 101;

SELECT employee_id, last_name, department_id
FROM employees
WHERE department_id = 90;

SELECT first_name, last_name
FROM employees
WHERE last_name = 'Taylor';

SELECT last_name, salary
FROM employees
WHERE salary <= 3000;