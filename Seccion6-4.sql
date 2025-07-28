--Autounion
SELECT worker.last_name || ' works for ' || manager.last_name AS "Works for"
FROM employees worker
JOIN employees manager ON worker.manager_id = manager.employee_id;

SELECT worker.last_name, worker.manager_id, manager.last_name AS "Manager name"
FROM employees worker
JOIN employees manager ON worker.manager_id = manager.employee_id;

--Consultas jerarquicas
WITH RECURSIVE emp_hierarchy AS 
(
    SELECT employee_id, last_name, job_id, manager_id
    FROM employees
    WHERE employee_id = 100

    UNION ALL

    SELECT e.employee_id, e.last_name, e.job_id, e.manager_id
    FROM employees e
    INNER JOIN emp_hierarchy h ON e.manager_id = h.employee_id
)
SELECT * 
FROM emp_hierarchy;

WITH RECURSIVE hierarchy AS 
(
    SELECT e.employee_id, e.manager_id, e.last_name, NULL::TEXT AS manager_name
    FROM employees e
    WHERE last_name = 'King'

    UNION ALL

    SELECT e.employee_id, e.manager_id, e.last_name, h.last_name AS manager_name
    FROM employees e
    JOIN hierarchy h ON e.manager_id = h.employee_id
)
SELECT last_name || ' reports to ' || COALESCE(manager_name,'No Manager') AS "Walk Top Down"
FROM hierarchy;

--Consultas jerarquicas y LEVEL
WITH RECURSIVE hierarchy AS 
(
    SELECT e.employee_id, e.manager_id, e.last_name, NULL::TEXT AS manager_name, 1 AS level
    FROM employees e
    WHERE last_name = 'King'

    UNION ALL

    SELECT e.employee_id, e.manager_id, e.last_name, h.last_name AS manager_name, h.level + 1 AS level
    FROM employees e
    JOIN hierarchy h ON e.manager_id = h.employee_id
)
SELECT level, last_name || ' reports to ' || COALESCE(manager_name,'No Manager') AS "Walk Top Down"
FROM hierarchy;

WITH RECURSIVE hierarchy AS 
(
    SELECT e.employee_id, e.manager_id, e.last_name, 1 AS level
    FROM employees e
    WHERE last_name = 'King'

    UNION ALL

    SELECT e.employee_id, e.manager_id, e.last_name, h.level + 1 AS level
    FROM employees e
    JOIN hierarchy h ON e.manager_id = h.employee_id
)
SELECT LPAD(last_name, LENGTH(last_name) + (level * 2) - 2, '_') AS "Org Chart"
FROM hierarchy;

--Consulta jerarquica de abajo a arriba
WITH RECURSIVE hierarchy AS 
(
    SELECT e.employee_id, e.manager_id, e.last_name, 1 AS level
    FROM employees e
    WHERE last_name = 'Grant'

    UNION ALL

    SELECT m.employee_id, m.manager_id, m.last_name, h.level + 1 AS level
    FROM employees m
    JOIN hierarchy h ON m.employee_id = h.manager_id
)
SELECT LPAD(last_name, LENGTH(last_name) + (level * 2) - 2, '_') AS org_chart
FROM hierarchy;

--Depuracion de consultas jerarquicas
WITH RECURSIVE hierarchy AS 
(
    SELECT e.employee_id, e.manager_id, e.last_name
    FROM employees e
    WHERE last_name = 'Kochhar'

    UNION ALL

    SELECT e.employee_id, e.manager_id, e.last_name
    FROM employees e
    JOIN hierarchy h ON e.manager_id = h.employee_id
)
SELECT last_name
FROM hierarchy
WHERE last_name != 'Higgins';

WITH RECURSIVE hierarchy AS 
(
    SELECT e.employee_id, e.manager_id, e.last_name
    FROM employees e
    WHERE last_name = 'Kochhar'

    UNION ALL

    SELECT e.employee_id, e.manager_id, e.last_name
    FROM employees e
    JOIN hierarchy h ON e.manager_id = h.employee_id
    WHERE e.last_name != 'Higgins'
)
SELECT last_name
FROM hierarchy;