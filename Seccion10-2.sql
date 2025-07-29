--Subconsultas de diferentes tablas
SELECT last_name, job_id, department_id
FROM employees
WHERE department_id = 
(
    SELECT department_id
    FROM departments
    WHERE department_name = 'Marketing'
)
ORDER BY job_id;

SELECT last_name, job_id, salary, department_id
FROM employees
WHERE job_id = 
(
    SELECT job_id
    FROM employees 
    WHERE employee_id = 141
)
AND department_id = 
(
    SELECT department_id
    FROM departments 
    WHERE location_id = 1500
);

SELECT last_name, salary
FROM employees
WHERE salary < 
(
    SELECT AVG(salary)
    FROM employees
);

SELECT department_id, MIN(salary)
FROM employees
GROUP BY department_id
HAVING MIN(salary) >
(
    SELECT MIN(salary)
    FROM employees
    WHERE department_id = 50
);