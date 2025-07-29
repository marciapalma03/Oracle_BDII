--Funcion ROLLUP
SELECT department_id, job_id, SUM(salary)
FROM employees
WHERE department_id < 50
GROUP BY ROLLUP (department_id, job_id);

SELECT department_id, job_id, SUM(salary)
FROM employees
WHERE department_id < 50
GROUP BY department_id, job_id;

--Funcion CUBE
SELECT department_id, job_id, SUM(salary)
FROM employees
WHERE department_id < 50
GROUP BY CUBE (department_id, job_id);

--Funcion GROUPING SETS
SELECT department_id, job_id, manager_id, SUM(salary) AS total_salary
FROM employees
WHERE department_id < 50
GROUP BY GROUPING SETS 
(
    (job_id, manager_id),
    (department_id, job_id),
    (department_id, manager_id)
);

SELECT department_id, job_id, SUM(salary) AS total_salary, GROUPING(department_id) AS dept_sub_total, GROUPING(job_id) AS job_sub_total
FROM employees
WHERE department_id < 50
GROUP BY CUBE (department_id, job_id);