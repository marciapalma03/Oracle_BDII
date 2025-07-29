--Subconsultas
SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date > 
(
    SELECT hire_date
    FROM employees
    WHERE last_name = 'Vargas'
);

SELECT last_name
FROM employees
WHERE department_id = 
(
    SELECT department_id
    FROM employees
    WHERE last_name = 'Grant'
);