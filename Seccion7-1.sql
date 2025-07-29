--Union igualitaria
SELECT e.last_name, e.job_id, j.job_title
FROM employees e
JOIN jobs j ON e.job_id = j.job_id;

SELECT e.last_name, d.department_name
FROM employees e
JOIN departments d ON e.department_id = d.department_id;

SELECT e.last_name, e.job_id, j.job_title
FROM employees e
JOIN jobs j ON e.job_id = j.job_id
WHERE e.department_id = 80;

--Union de producto cartesiano
SELECT e.last_name, d.department_name
FROM employees e
CROSS JOIN departments d;

SELECT e.last_name, l.city
FROM employees e
JOIN departments d ON e.department_id = d.department_id
JOIN locations l ON d.location_id = l.location_id;