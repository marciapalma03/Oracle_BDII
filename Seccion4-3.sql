--Trabajar fechas
SELECT last_name, hire_date + INTERVAL '60 days'
FROM employees;

SELECT last_name,(CURRENT_DATE - hire_date) / 7 AS weeks_worked
FROM employees;

CREATE TABLE job_history 
(
    employee_id     NUMERIC(6,0) NOT NULL,
    start_date      DATE NOT NULL,
    end_date        DATE NOT NULL,
    job_id          VARCHAR(10) NOT NULL,
    department_id   NUMERIC(4,0),
    CONSTRAINT jhist_date_interval CHECK (end_date > start_date),
    CONSTRAINT jhist_emp_id_st_date_pk PRIMARY KEY (employee_id, start_date)
);

INSERT INTO job_history(employee_id, start_date, end_date, job_id, department_id)
VALUES (200, DATE '1987-09-17', DATE '1993-06-17', 'AD_ASST', 90);

INSERT INTO job_history(employee_id, start_date, end_date, job_id, department_id)
VALUES (101, DATE '1993-10-28', DATE '1997-03-15', 'AC_MGR', 110);

INSERT INTO job_history(employee_id, start_date, end_date, job_id, department_id)
VALUES (200, DATE '1994-07-01', DATE '1998-12-31', 'AC_ACCOUNT', 90);

INSERT INTO job_history(employee_id, start_date, end_date, job_id, department_id)
VALUES (101, DATE '1989-09-21', DATE '1993-10-27', 'AC_ACCOUNT', 110);

INSERT INTO job_history(employee_id, start_date, end_date, job_id, department_id)
VALUES (176, DATE '1999-01-01', DATE '1999-12-31', 'SA_MAN', 80);

INSERT INTO job_history(employee_id, start_date, end_date, job_id, department_id)
VALUES (176, DATE '1998-03-24', DATE '1998-12-31', 'SA_REP', 80);

INSERT INTO job_history(employee_id, start_date, end_date, job_id, department_id)
VALUES (122, DATE '1999-01-01', DATE '1999-12-31', 'ST_CLERK', 50);

INSERT INTO job_history(employee_id, start_date, end_date, job_id, department_id)
VALUES (114, DATE '1998-03-24', DATE '1999-12-31', 'ST_CLERK', 50);

INSERT INTO job_history(employee_id, start_date, end_date, job_id, department_id)
VALUES (102, DATE '1993-01-13', DATE '1998-07-24', 'IT_PROG', 60);

INSERT INTO job_history(employee_id, start_date, end_date, job_id, department_id)
VALUES (201, DATE '1996-02-17', DATE '1999-12-19', 'MK_REP', 20);

SELECT employee_id,(end_date - start_date) / 365 AS "Tenure in last job"
FROM job_history;

--Funciones de fecha
SELECT last_name, hire_date
FROM employees
WHERE EXTRACT(YEAR FROM AGE(CURRENT_DATE, hire_date)) * 12 +EXTRACT(MONTH FROM AGE(CURRENT_DATE, hire_date)) > 240;

SELECT CURRENT_TIMESTAMP + INTERVAL '12 months' AS "Next Year";

SELECT (date_trunc('MONTH', CURRENT_DATE) + INTERVAL '1 MONTH - 1 day') AS "End of the Month";

SELECT hire_date, CASE WHEN EXTRACT(DAY FROM hire_date) >= 16 THEN (date_trunc('month', hire_date) + INTERVAL '1 month')::date
ELSE date_trunc('month', hire_date)::date END AS rounded_month
FROM employees
WHERE department_id = 50;

SELECT hire_date, CASE WHEN EXTRACT(MONTH FROM hire_date) >= 7 THEN make_date(EXTRACT(YEAR FROM hire_date)::int + 1, 1, 1)
ELSE make_date(EXTRACT(YEAR FROM hire_date)::int, 1, 1) END AS rounded_year
FROM employees
WHERE department_id = 50;

SELECT employee_id, hire_date,
ROUND(((EXTRACT(YEAR FROM AGE(CURRENT_DATE, hire_date)) * 12) + EXTRACT(MONTH FROM AGE(CURRENT_DATE, hire_date)))) AS tenure,
hire_date + INTERVAL '6 months' AS review, hire_date + (((5 - EXTRACT(DOW FROM hire_date) + 7) % 7 + 1) * INTERVAL '1 day') AS next_friday,
(date_trunc('MONTH', hire_date) + INTERVAL '1 month - 1 day')::date AS last_day
FROM employees
WHERE ((EXTRACT(YEAR FROM AGE(CURRENT_DATE, hire_date)) * 12) + EXTRACT(MONTH FROM AGE(CURRENT_DATE, hire_date))) > 36;
