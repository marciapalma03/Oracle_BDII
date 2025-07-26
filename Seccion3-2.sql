--Clausula ORDER BY
SELECT last_name, hire_date
FROM employees
ORDER BY hire_date;

--Orden descendente
SELECT last_name, hire_date
FROM employees
ORDER BY hire_date DESC;

--Uso de alias con ORDEN BY
SELECT last_name, hire_date AS "Date Started"
FROM employees
ORDER BY hire_date;

--Ordenacion con otra columna
SELECT employee_id, first_name, last_name
FROM employees
WHERE employee_id < 105
ORDER BY last_name;

--Ordenacion con varias columnas
SELECT department_id, last_name
FROM employees
WHERE department_id <= 50 
ORDER BY department_id, last_name;

--Ordenacion con varias columnas de forma descendente
SELECT department_id, last_name
FROM employees
WHERE department_id <= 50 
ORDER BY department_id DESC, last_name;