--Operador AND
SELECT last_name, department_id, salary
FROM employees
WHERE department_id > 50 AND salary > 12000;

SELECT last_name, hire_date, job_id
FROM employees
WHERE hire_date > '01-Jan-1998' AND job_id LIKE 'SA%';

--Operador OR
SELECT department_name, manager_id, location_id
FROM departments
WHERE location_id = 2500 OR manager_id = 124;

--Operador NOT
SELECT department_name, location_id
FROM departments
WHERE location_id NOT IN (1700, 1800);

--Reglas de prioridad
SELECT last_name || ' ' || salary * 1.05 AS "Employee Raise"
FROM employees
WHERE department_id IN (50, 80) AND (first_name LIKE 'C%' OR last_name LIKE '%s%');

SELECT last_name || ' ' || salary * 1.05 AS "Employee Raise", department_id, first_name
FROM employees
WHERE department_id IN (50, 80)
AND (first_name LIKE 'C%' OR last_name LIKE '%s%');

SELECT last_name || ' ' || salary * 1.05 AS "Employee Raise", department_id, first_name
FROM employees
WHERE (department_id IN (50, 80) OR first_name LIKE 'C%')
AND last_name LIKE '%s%';