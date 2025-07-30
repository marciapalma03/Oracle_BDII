--Subconsulta correlacionada
SELECT o.first_name, o.last_name, o.salary
FROM employees o
WHERE o.salary > 
(
    SELECT AVG(i.salary)
    FROM employees i
    WHERE i.department_id = o.department_id
);

--Subconsultas con EXISTS, NOT EXISTS y NOT IN
SELECT last_name AS "Not a Manager"
FROM employees emp 
WHERE NOT EXISTS 
(
    SELECT 1
    FROM employees mgr
    WHERE mgr.manager_id = emp.employee_id
);

SELECT last_name AS "Not a Manager"
FROM employees emp
WHERE emp.employee_id NOT IN 
(
    SELECT mgr.manager_id
    FROM employees mgr
    WHERE mgr.manager_id IS NOT NULL
);

--Clausula WITH
WITH managers AS 
(
    SELECT DISTINCT manager_id
    FROM employees
    WHERE manager_id IS NOT NULL
)
SELECT last_name AS "Not a manager"
FROM employees
WHERE employee_id NOT IN 
(
    SELECT manager_id
    FROM managers
);