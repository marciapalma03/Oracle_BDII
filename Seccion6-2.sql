--Clausula USING
SELECT first_name, last_name, department_id, department_name
FROM employees
JOIN departments USING (department_id);

SELECT first_name, last_name, department_id, department_name
FROM employees 
JOIN departments USING (department_id)
WHERE last_name = 'Higgins';

--Clausula ON
SELECT last_name, job_title
FROM employees e
JOIN jobs j ON (e.job_id = j.job_id);

SELECT last_name, job_title
FROM employees e
JOIN jobs j ON (e.job_id = j.job_id)
WHERE last_name LIKE 'H%';

CREATE TABLE job_grades 
(
  grade_level  VARCHAR(3),
  lowest_sal   NUMERIC,
  highest_sal  NUMERIC
);

INSERT INTO job_grades (grade_level, lowest_sal, highest_sal)
VALUES ('A', 1000, 2999);

INSERT INTO job_grades (grade_level, lowest_sal, highest_sal)
VALUES ('B', 3000, 5999);

INSERT INTO job_grades (grade_level, lowest_sal, highest_sal)
VALUES ('C', 6000, 9999);

INSERT INTO job_grades (grade_level, lowest_sal, highest_sal)
VALUES ('D', 10000, 14999);

INSERT INTO job_grades (grade_level, lowest_sal, highest_sal)
VALUES ('E', 15000, 24999);

INSERT INTO job_grades (grade_level, lowest_sal, highest_sal)
VALUES ('F', 25000, 40000);

--Clausula ON con operador distinto
SELECT last_name, salary, grade_level, lowest_sal, highest_sal
FROM employees 
JOIN job_grades ON (salary BETWEEN lowest_sal AND highest_sal);

--Union de tres tablas
SELECT last_name, department_name AS "Department", city
FROM employees
JOIN departments USING (department_id)
JOIN locations USING (location_id);