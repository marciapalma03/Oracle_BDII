--Funcion MAX
SELECT MAX(salary)
FROM employees;

--Funcion MIN
SELECT MIN(life_expect_at_birth) AS "Lowest Life Exp"
FROM wf_countries;

SELECT MIN(country_name)
FROM wf_countries;

SELECT MIN(hire_date)
FROM employees;

--Funcion MAX
SELECT MAX(life_expect_at_birth) AS "Highest Life Exp"
FROM wf_countries;

SELECT MAX(country_name)
FROM wf_countries;

SELECT MAX(hire_date)
FROM employees;

--Funcion SUM
SELECT SUM(area)
FROM wf_countries
WHERE region_id = 29;

SELECT SUM(salary)
FROM employees
WHERE department_id = 90;

--Funcion AVG
SELECT AVG(commission_pct)
FROM employees;

--Mas de una funcion
SELECT MAX(salary), MIN(salary), MIN(employee_id)
FROM employees
WHERE department_id = 60;