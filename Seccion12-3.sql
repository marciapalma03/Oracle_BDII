CREATE TABLE my_employees (
hire_date
DATE DEFAULT SYSDATE,
first_name
VARCHAR2(15), 
last_name
VARCHAR2(15));

INSERT INTO my_employees
(hire_date, first_name, last_name)
VALUES
(DEFAULT, 'Angelina','Wright');

INSERT INTO my_employees
(first_name, last_name)
VALUES
('Angelina','Wright');

UPDATE my_employees
SET hire_date = DEFAULT
WHERE last_name = 'Wright';

MERGE INTO destination-table USING source-table
ON matching-condition
WHEN MATCHED THEN UPDATE
SET ……
WHEN NOT MATCHED THEN INSERT
VALUES (……);

MERGE INTO copy_empc  USING employees e
ON (c.employee_id= e.employee_id)
WHEN MATCHED THEN UPDATE
SET
c.last_name = e.last_name,
c.department_id = e.department_id
WHEN NOT MATCHED THEN INSERT 
VALUES   (e.employee_id, e.last_name, e.department_id);

INSERT ALL
INTO my_employees
VALUES (hire_date, first_name, last_name)
INTO copy_my_employees
VALUES (hire_date, first_name, last_name)
SELECT hire_date, first_name, last_name
FROM employees;

INSERT ALL
WHEN call_ format IN ('tlk','txt','pic') THEN
INTO all_calls
VALUES (caller_id, call_timestamp, call_duration, call_format)
WHEN call_ format IN ('tlk','txt') THEN
INTO police_record_calls
VALUES (caller_id, call_timestamp, recipient_caller)
WHEN call_duration < 50 AND call_type = 'tlk' THEN
INTO short_calls
VALUES (caller_id, call_timestamp, call_duration)
WHEN call_duration > = 50 AND call_type = 'tlk' THEN
INTO long_calls
VALUES (caller_id, call_timestamp, call_duration)
SELECT caller_id, call_timestamp, call_duration, call_format, 
recipient_caller
FROM calls
WHERE TRUNC(call_timestamp ) = TRUNC(SYSDATE);

