--Union no igualitaria
SELECT e.last_name, e.salary, jg.grade_level, jg.lowest_sal, jg.highest_sal
FROM employees e
JOIN job_grades jg ON e.salary BETWEEN jg.lowest_sal AND jg.highest_sal;

--Union externa
SELECT e.last_name, d.department_id, d.department_name
FROM employees e
LEFT JOIN departments d ON e.department_id = d.department_id;

SELECT e.last_name, d.department_id, d.department_name
FROM employees e
RIGHT JOIN departments d ON e.department_id = d.department_id;