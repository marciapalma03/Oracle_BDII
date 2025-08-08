--Consultas
SELECT e.last_name, e.salary, e.department_id, d.maxsal
FROM employees e,
(SELECT department_id, MAX(salary) AS maxsal
FROM employees
GROUP BY department_id) d
WHERE e.department_id = d.department_id AND e.salary = d.maxsal;

SELECT last_name, hire_date
FROM employees
ORDER BY hire_date ASC
LIMIT 5;

SELECT ROW_NUMBER() OVER (ORDER BY hire_date) AS "Longest employed", last_name, hire_date
FROM employees
ORDER BY hire_date
LIMIT 5;