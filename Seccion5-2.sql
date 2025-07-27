--Evaluacion de funciones
SELECT TO_CHAR((hire_date + INTERVAL '6 months') + 
((5 - EXTRACT(DOW FROM (hire_date + INTERVAL '6 months')) + 7) % 7 + 1) * INTERVAL 
'1 day', 'FMDay, Month DDth, YYYY') AS "Next Evaluation"
FROM employees
WHERE employee_id = 100;

--Funcion NVL1
SELECT country_name, COALESCE(internet_extension, 'None') AS "Internet extn"
FROM wf_countries
WHERE location = 'Southern Africa'
ORDER BY internet_extension DESC;

SELECT last_name, COALESCE(commission_pct, 0)
FROM employees
WHERE department_id IN (80, 90);

SELECT COALESCE(date_of_independence, 'No date')
FROM wf_countries;

SELECT last_name, COALESCE(commission_pct, 0) * 250 AS "Commission"
FROM employees
WHERE department_id IN (80, 90);

--Funcion NVL2
SELECT last_name, salary, CASE 
WHEN commission_pct IS NOT NULL 
THEN salary + (salary * commission_pct)
ELSE salary 
END AS income
FROM employees
WHERE department_id IN (80, 90);

--Funcion NULLIF
SELECT first_name, LENGTH(first_name) AS "Length FN", last_name,
LENGTH(last_name) AS "Length LN", NULLIF(LENGTH(first_name), LENGTH(last_name)) AS "Compare Them"
FROM employees;

--Funcion COALESCE
SELECT last_name, COALESCE(commission_pct, salary, 10) AS "Comm"
FROM employees
ORDER BY commission_pct;