--Funcion COUNT
SELECT COUNT(job_id)
FROM employees;

SELECT commission_pct
FROM employees;

SELECT COUNT(commission_pct)
FROM employees;

SELECT COUNT(*)
FROM employees
WHERE hire_date < DATE '1996-01-01';

--Funcion DISTINCT
SELECT job_id
FROM employees;

SELECT DISTINCT job_id
FROM employees;

SELECT DISTINCT job_id, department_id
FROM employees;

--Funcion DISTINCT y SUM
SELECT SUM(salary)
FROM employees
WHERE department_id = 90;

SELECT SUM(DISTINCT salary)
FROM employees
WHERE department_id = 90;

--Funcion DISTINCT y COUNT
SELECT COUNT(DISTINCT job_id)
FROM employees;

SELECT COUNT(DISTINCT salary)
FROM employees;

--Funcion AVG y NVL
SELECT AVG(commission_pct)
FROM employees;

SELECT AVG(COALESCE(commission_pct, 0))
FROM employees;