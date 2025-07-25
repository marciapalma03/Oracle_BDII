--Operadores BETWEEN y AND 
SELECT last_name, salary
FROM employees
WHERE salary BETWEEN 9000 AND 11000;

--Condicion IN
SELECT city, state_province, country_id
FROM locations
WHERE country_id IN ('UK', 'CA');

--Condicion OR
SELECT city, state_province, country_id
FROM locations
WHERE country_id = 'UK' OR country_id = 'CA';

--Condicion LIKE
SELECT last_name
FROM employees
WHERE last_name LIKE '_o%';

--Opcion ESCAPE
SELECT last_name, job_id
FROM employees
WHERE job_id LIKE '%\_R%' ESCAPE '\';

SELECT last_name, job_id
FROM employees
WHERE job_id LIKE '%_R%';

SELECT last_name, manager_id
FROM employees
WHERE manager_id IS NULL;

SELECT last_name, commission_pct
FROM employees
WHERE commission_pct IS NOT NULL;