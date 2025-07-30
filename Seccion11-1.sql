--Diferentes tipos de consultas
SELECT table_name
FROM information_schema.tables
WHERE table_schema = current_schema() AND table_name ILIKE 'jo%';

SELECT LEFT(first_name, 1) || ' ' || last_name AS full_name
FROM employees;

SELECT first_name || ' ' || last_name || ' ' || email  AS full_info
FROM employees
WHERE email ILIKE '%IN%';

SELECT MIN(last_name) AS "Apellido más pequeño",
MAX(last_name) AS "Apellido más grande"
FROM employees;

SELECT TO_CHAR(salary/4, '$9999.99') AS weekly_salary
FROM employees
WHERE salary/4 BETWEEN 700 AND 3000;

SELECT e.first_name || ' ' || e.last_name AS employee_name, j.job_title
FROM employees e
JOIN jobs j ON e.job_id = j.job_id
ORDER BY j.job_title;

SELECT e.first_name || ' ' || e.last_name AS employee_name, j.job_title, j.min_salary || ' - ' || j.max_salary AS salary_range, e.salary
FROM employees e
JOIN jobs j ON e.job_id = j.job_id
ORDER BY j.job_title, e.salary;

SELECT SUBSTR(e.first_name, 1, 1) AS initial, e.last_name, d.department_name
FROM employees e
JOIN departments d ON e.department_id = d.department_id
ORDER BY d.department_name, e.last_name;

SELECT SUBSTR(first_name, 1, 1) AS initial, last_name, department_name
FROM employees
JOIN departments USING (department_id)
ORDER BY department_name, last_name;

SELECT last_name,
CASE 
WHEN manager_id IS NULL THEN 'nobody'
ELSE 'somebody'
END AS has_manager
FROM employees;

SELECT LEFT(first_name, 1) || ' ' || last_name AS "Employee Name", salary AS "Salary",
CASE 
WHEN commission_pct IS NULL THEN 'No'
ELSE 'Yes'
END AS "Commission"
FROM employees;

SELECT e.last_name, d.department_name, l.city, l.state_province
FROM departments d
LEFT JOIN employees e ON e.department_id = d.department_id
JOIN locations l ON d.location_id = l.location_id
ORDER BY d.department_name, e.last_name;

SELECT first_name, last_name,
COALESCE
(commission_pct, manager_id, -1) AS result_value
FROM employees;

SELECT e.last_name, e.salary, j.grade_level AS job_grade
FROM employees e
JOIN job_grades j ON e.salary BETWEEN j.lowest_sal AND j.highest_sal
WHERE e.department_id > 50
ORDER BY e.last_name;

SELECT e.last_name, d.department_name
FROM employees e
FULL OUTER JOIN departments d ON e.department_id = d.department_id
ORDER BY e.last_name NULLS LAST, d.department_name;

WITH RECURSIVE employee_hierarchy AS 
(
    SELECT e.employee_id, e.last_name, e.manager_id, NULL::VARCHAR AS manager_last_name, 1 AS position_level
    FROM employees e
    WHERE e.employee_id = 100

    UNION ALL

    SELECT e.employee_id, e.last_name, e.manager_id, m.last_name AS manager_last_name, eh.position_level + 1
    FROM employees e
    JOIN employee_hierarchy eh ON e.manager_id = eh.employee_id
    LEFT JOIN employees m ON e.manager_id = m.employee_id
)
SELECT employee_id, last_name, manager_last_name, position_level
FROM employee_hierarchy
ORDER BY position_level, manager_last_name, last_name;

SELECT MIN(hire_date) AS first_hire_date, MAX(hire_date) AS last_hire_date, COUNT(*) AS number_of_employees
FROM employees;

SELECT d.department_name, SUM(e.salary) AS department_cost
FROM employees e
JOIN departments d ON e.department_id = d.department_id
GROUP BY d.department_name
HAVING SUM(e.salary) BETWEEN 15000 AND 31000
ORDER BY department_cost;

SELECT d.department_name, d.manager_id, m.last_name AS manager_last_name, ROUND(AVG(e.salary), 2) AS average_salary
FROM departments d
LEFT JOIN employees m ON d.manager_id = m.employee_id
LEFT JOIN employees e ON d.department_id = e.department_id
GROUP BY d.department_name, d.manager_id, m.last_name
ORDER BY average_salary DESC;

SELECT ROUND(MAX(avg_salary)) AS highest_avg_salary
FROM 
(
    SELECT AVG(salary) AS avg_salary
    FROM employees
    GROUP BY department_id
) AS dept_avgs;

SELECT d.department_name, SUM(e.salary) AS monthly_cost
FROM employees e
JOIN departments d ON e.department_id = d.department_id
GROUP BY d.department_name
ORDER BY monthly_cost DESC;

SELECT d.department_name, e.job_id, SUM(e.salary) AS monthly_cost
FROM employees e
JOIN departments d ON e.department_id = d.department_id
GROUP BY ROLLUP (d.department_name, e.job_id)
ORDER BY d.department_name NULLS LAST, e.job_id NULLS LAST;

SELECT d.department_name, e.job_id, SUM(e.salary) AS monthly_cost
FROM employees e
JOIN departments d ON e.department_id = d.department_id
GROUP BY CUBE (d.department_name, e.job_id)
ORDER BY d.department_name NULLS LAST, e.job_id NULLS LAST;

SELECT d.department_name, e.job_id, SUM(e.salary) AS monthly_cost, GROUPING(d.department_name) AS dept_grouping, GROUPING(e.job_id) AS job_grouping
FROM employees e
JOIN departments d ON e.department_id = d.department_id
GROUP BY CUBE (d.department_name, e.job_id)
ORDER BY d.department_name NULLS LAST, e.job_id NULLS LAST;

SELECT d.department_name, e.job_id, l.city, SUM(e.salary) AS monthly_cost
FROM employees e
JOIN departments d ON e.department_id = d.department_id
JOIN locations l ON d.location_id = l.location_id
GROUP BY GROUPING SETS ((d.department_name, e.job_id), (l.city))
ORDER BY l.city NULLS LAST, d.department_name NULLS LAST, e.job_id NULLS LAST;

SELECT (e.first_name || ' ' || e.last_name) AS name, e.department_id::TEXT AS info
FROM employees e

UNION ALL

SELECT d.department_id::TEXT AS name, d.department_name AS info
FROM departments d

UNION ALL

SELECT l.city AS name, NULL AS info
FROM locations l;

SELECT (LEFT(e.first_name, 1) || '. ' || e.last_name) AS employee_name, e.salary, d.department_name
FROM employees e
JOIN departments d ON e.department_id = d.department_id
WHERE e.salary > 
(
    SELECT AVG(e2.salary)
    FROM employees e2
    WHERE e2.department_id = e.department_id
)
ORDER BY d.department_name, e.salary DESC;