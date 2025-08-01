--Sentencia UPDATE
UPDATE copy_employees
SET phone_number = '123456'
WHERE employee_id = 303;

UPDATE copy_employees
SET phone_number = '654321', last_name = 'Jones'
WHERE employee_id >= 303;

UPDATE copy_employees
SET phone_number = '654321', last_name = 'Jones';

UPDATE copy_employees
SET salary = 
(
    SELECT salary
    FROM copy_employees
    WHERE employee_id = 100
)
WHERE employee_id = 101;

UPDATE copy_employees
SET salary = (SELECT salary FROM copy_employees WHERE employee_id = 205),
job_id = (SELECT job_id FROM copy_employees WHERE employee_id = 205)
WHERE employee_id = 206;

UPDATE copy_employees
SET salary = 
(
    SELECT salary
    FROM employees
    WHERE employee_id = 205
)
WHERE employee_id = 202;

ALTER TABLE copy_employees
ADD COLUMN department_name VARCHAR(30) NOT NULL DEFAULT 'Unknown';

UPDATE copy_employees e
SET department_name = d.department_name
FROM departments d
WHERE e.department_id = d.department_id;

--Sentencia DELETE
DELETE FROM copy_employees
WHERE employee_id = 303;

DELETE FROM copy_employees e
USING departments d
WHERE e.department_id = d.department_id AND d.department_name = 'Shipping';

DELETE FROM copy_employees e
WHERE e.manager_id IN 
(
    SELECT d.manager_id
    FROM employees d
    GROUP BY d.manager_id
    HAVING COUNT(d.department_id) < 2
);

UPDATE employees SET department_id = 15
WHERE employee_id = 100;

DELETE FROM departments WHERE department_id = 10;

UPDATE employees SET department_id = 10
WHERE department_id = 20;

--Clausula FOR UPDATE
SELECT e.employee_id, e.salary, d.department_name
FROM employees e
JOIN departments d USING (department_id)
WHERE e.job_id = 'ST_CLERK' AND d.location_id = 1500
ORDER BY e.employee_id
FOR UPDATE;