--Diferentes tipos de consultas
SELECT LOWER(first_name) AS lower_name
FROM employees;

SELECT UPPER(last_name) AS upper_name
FROM employees;

SELECT INITCAP(first_name) AS proper_case
FROM employees;

SELECT first_name || ' ' || last_name AS full_name
FROM employees;

SELECT SUBSTRING(first_name FROM 2 FOR 4) AS sub_name
FROM employees;

SELECT LENGTH(email) AS email_length
FROM employees;

SELECT POSITION('@' IN email) AS at_position
FROM employees;

SELECT LPAD(first_name, 10, '*') AS padded_name
FROM employees;

SELECT RPAD(first_name, 10, '*') AS padded_name
FROM employees;

SELECT TRIM(first_name) AS trimmed_name
FROM employees;

SELECT REPLACE(email, '@company.com', '@example.com') AS new_email
FROM employees;

SELECT ROUND(salary, 2) AS rounded_salary
FROM employees;

SELECT ROUND(salary) AS rounded_salary
FROM employees;

SELECT TRUNC(salary, 2) AS truncated_salary
FROM employees;

SELECT TRUNC(salary) AS truncated_salary
FROM employees;

SELECT MOD(salary, 3) AS remainder
FROM employees;

SELECT
date_trunc('year',  hire_date)::date  AS trunc_year,
date_trunc('month', hire_date)::date  AS trunc_month,
date_trunc('day',   hire_date)::date  AS trunc_day
FROM employees;

SELECT 
(
    date_trunc('year', hire_date)
    + INTERVAL '1 year' * CASE WHEN hire_date >= (date_trunc('year', hire_date) + INTERVAL '6 months') THEN 1 ELSE 0 END
)
::date AS round_year
FROM employees;

SELECT 
(
    date_trunc('month', hire_date)
    + INTERVAL '1 month' * CASE WHEN EXTRACT(day FROM hire_date) >= 16 THEN 1 ELSE 0 END
)
::date AS round_month
FROM employees;

SELECT
((EXTRACT(year  FROM age(a.hire_date, b.hire_date)) * 12)
+  EXTRACT(month FROM age(a.hire_date, b.hire_date))
+  EXTRACT(day   FROM age(a.hire_date, b.hire_date)) / 31.0) AS months_between
FROM employees a
JOIN employees b ON a.employee_id <> b.employee_id
LIMIT 1;

SELECT (hire_date + (n || ' months')::interval)::date AS added
FROM employees
CROSS JOIN (VALUES (3), (-2)) AS t(n);

SELECT 
(
    hire_date
    + (((5 - EXTRACT(dow FROM hire_date)::int + 7) % 7)    -- 5 = viernes 
    + CASE WHEN ((5 - EXTRACT(dow FROM hire_date)::int + 7) % 7) = 0 THEN 7 ELSE 0 END)::int
)
::date AS next_friday
FROM employees;

SELECT (date_trunc('month', hire_date) + INTERVAL '1 month' - INTERVAL '1 day')::date AS last_day
FROM employees;

SELECT salary, TO_CHAR(salary, 'FM999,999,990.00') AS salary_formatted
FROM employees;

SELECT hire_date, TO_CHAR(hire_date, 'DD-Mon-YYYY') AS formatted_date
FROM employees;

SELECT TO_NUMBER('1,234.56', '999G999D99') AS converted_number;

SELECT TO_DATE('07-Sep-1998', 'DD-Mon-YYYY') AS converted_date;

SELECT employee_id, COALESCE(CAST(bonus AS VARCHAR), 'Sin bono') AS bono_texto
FROM employees;

SELECT 
CASE 
WHEN bonus IS NOT NULL THEN 'Tiene bono'
ELSE 'Sin bono'
END AS estado_bono
FROM employees;

SELECT employee_id, NULLIF(salary, 0) AS salario_nulo_si_cero
FROM employees;

SELECT COALESCE(first_name, 'Sin nombre') AS nombre
FROM employees;

SELECT first_name,
CASE department_id
WHEN 10 THEN 'Administration'
WHEN 20 THEN 'Marketing'
WHEN 30 THEN 'Purchasing'
ELSE 'Other'
END AS department_name
FROM employees;

SELECT first_name, last_name, department_id,
CASE department_id
WHEN 10 THEN 'Administration'
WHEN 20 THEN 'Marketing'
WHEN 30 THEN 'Purchasing'
ELSE 'Other Department'
END AS department_name
FROM employees;

SELECT e.last_name, d.department_name
FROM employees e
CROSS JOIN departments d;

SELECT employee_id, last_name, department_name
FROM employees
NATURAL JOIN departments;

SELECT e.employee_id, e.last_name, e.salary, j.grade_level
FROM employees e
JOIN job_grades j ON e.salary BETWEEN j.lowest_sal AND j.highest_sal;

SELECT employee_id, last_name, department_name
FROM employees
JOIN departments
USING (department_id);

SELECT e.employee_id, e.last_name, d.department_id, d.location_id
FROM employees e
JOIN departments d ON e.department_id = d.department_id;

SELECT e.employee_id, e.last_name, e.department_id, d.department_name
FROM employees e
RIGHT JOIN departments d ON e.department_id = d.department_id;

SELECT e.employee_id, e.last_name, e.department_id, d.department_name
FROM employees e 
LEFT JOIN departments d ON e.department_id = d.department_id;

SELECT e.employee_id, e.last_name, e.department_id, d.department_name
FROM employees e 
FULL OUTER JOIN departments d ON (e.department_id = d.department_id);

SELECT AVG(salary) AS avg_salary
FROM employees;

SELECT COUNT(*) AS total_employees
FROM employees;

SELECT COUNT(email) AS employees_with_email
FROM employees;

SELECT MIN(salary) AS lowest_salary
FROM employees;

SELECT MAX(salary) AS highest_salary
FROM employees;

SELECT SUM(salary) AS total_salaries
FROM employees;

SELECT VARIANCE(salary) AS salary_variance
FROM employees;

SELECT STDDEV(salary) AS salary_stddev
FROM employees;

SELECT department_id, AVG(salary) AS avg_salary
FROM employees
GROUP BY ROLLUP (department_id)
HAVING AVG(salary) > 0;

SELECT department_id, job_id, AVG(salary) AS avg_salary
FROM employees
GROUP BY CUBE (department_id, job_id)
HAVING AVG(salary) > 0;

SELECT department_id, job_id, AVG(salary) AS avg_salary
FROM employees
GROUP BY GROUPING SETS ((department_id), (job_id), ())
HAVING AVG(salary) > 0;

SELECT employee_id, first_name, last_name, salary
FROM employees
WHERE salary = 
(
    SELECT salary
    FROM employees
    WHERE employee_id = 101
);

SELECT employee_id, first_name, last_name, department_id, job_id
FROM employees
WHERE (department_id, job_id) = 
(
    SELECT department_id, job_id
    FROM employees
    WHERE employee_id = 101
);

SELECT employee_id, first_name, last_name, department_id, job_id
FROM employees
WHERE department_id = 
(
    SELECT department_id
    FROM employees
    WHERE employee_id = 101
)
AND job_id = 
(
    SELECT job_id
    FROM employees
    WHERE employee_id = 200
);

SELECT e.employee_id, e.first_name, e.last_name, e.department_id
FROM employees e
WHERE e.department_id = 
(
    SELECT d.department_id
    FROM departments d
    WHERE d.department_name = 'IT' AND d.department_id = e.department_id
);

