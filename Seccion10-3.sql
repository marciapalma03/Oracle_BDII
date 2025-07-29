--Subconsultas
SELECT first_name, last_name
FROM employees
WHERE salary IN 
(
    SELECT salary
    FROM employees
    WHERE department_id = 20
);

--Subconsultas con IN
SELECT last_name, hire_date
FROM employees
WHERE EXTRACT(YEAR FROM hire_date) IN 
(
    SELECT EXTRACT(YEAR FROM hire_date)
    FROM employees
    WHERE department_id = 90
);

--Subconsultas con ANY
SELECT last_name, hire_date
FROM employees
WHERE EXTRACT(YEAR FROM hire_date) < ANY 
(
    SELECT EXTRACT(YEAR FROM hire_date)
    FROM employees
    WHERE department_id = 90
);

--Subconsultas con ALL
SELECT last_name, hire_date
FROM employees
WHERE EXTRACT(YEAR FROM hire_date) < ALL 
(
    SELECT EXTRACT(YEAR FROM hire_date)
    FROM employees
    WHERE department_id = 90
);

SELECT last_name, employee_id
FROM employees
WHERE employee_id IN 
(
    SELECT manager_id
    FROM employees
);

SELECT last_name, employee_id
FROM employees
WHERE employee_id <= ALL 
(
    SELECT manager_id
    FROM employees
);

--Subconsultas con GROUP BY y HAVING
SELECT department_id, MIN(salary)
FROM employees
GROUP BY department_id
HAVING MIN(salary) < ANY 
(
    SELECT salary
    FROM employees
    WHERE department_id IN (10, 20)
)
ORDER BY department_id;

--Subconsulta de varias columnas
SELECT employee_id, manager_id, department_id
FROM employees
WHERE (manager_id, department_id) IN 
(SELECT manager_id, department_id
FROM employees WHERE employee_id IN (149, 174))
AND employee_id NOT IN (149, 174);

SELECT employee_id, manager_id, department_id
FROM employees
WHERE manager_id IN 
(SELECT manager_id FROM employees WHERE employee_id IN (149, 174))
AND department_id IN 
(SELECT department_id FROM employees WHERE employee_id IN (149, 174))
AND employee_id NOT IN (149, 174);

SELECT first_name, last_name, job_id
FROM employees
WHERE job_id IN 
(
    SELECT job_id
    FROM employees
    WHERE last_name = 'Ernst'
);