--Uso de DEFAULT
CREATE TABLE my_employees 
(
    hire_date DATE DEFAULT CURRENT_DATE,
    first_name VARCHAR(15),
    last_name VARCHAR(15)
);

INSERT INTO my_employees (hire_date, first_name, last_name)
VALUES (DEFAULT, 'Angelina', 'Wright');

INSERT INTO my_employees (first_name, last_name)
VALUES ('Angelina', 'Wright');

UPDATE my_employees
SET hire_date = DEFAULT
WHERE last_name = 'Wright';

--Uso de MERGE
MERGE INTO copy_employees AS c
USING employees AS e
ON c.employee_id = e.employee_id
WHEN MATCHED THEN UPDATE SET last_name = e.last_name, department_id = e.department_id
WHEN NOT MATCHED THEN INSERT (employee_id, last_name, department_id) VALUES (e.employee_id, e.last_name, e.department_id);

INSERT INTO employees (hire_date, first_name, last_name)
SELECT hire_date, first_name, last_name
FROM employees;

INSERT INTO copy_employees (hire_date, first_name, last_name)
SELECT hire_date, first_name, last_name
FROM employees;

-- ==========================================
-- TABLA DE ORIGEN
-- ==========================================
CREATE TABLE calls (
    caller_id         INTEGER,
    call_timestamp    TIMESTAMP NOT NULL,
    call_duration     INTEGER,
    call_format       VARCHAR(10),
    recipient_caller  INTEGER,
    call_type         VARCHAR(10)
);

INSERT INTO calls (caller_id, call_timestamp, call_duration, call_format, recipient_caller, call_type)
VALUES 
(101, NOW(), 30,  'tlk',  201, 'tlk'),
(102, NOW(), 10,  'txt',  202, 'txt'),
(103, NOW(), 70,  'tlk',  203, 'tlk'),
(104, NOW(), 20,  'pic',  204, 'pic'),
(105, NOW(), 55,  'tlk',  205, 'tlk');

CREATE TABLE all_calls 
(
    caller_id      INTEGER,
    call_timestamp TIMESTAMP,
    call_duration  INTEGER,
    call_format    VARCHAR(10)
);

CREATE TABLE police_record_calls 
(
    caller_id        INTEGER,
    call_timestamp   TIMESTAMP,
    recipient_caller INTEGER
);

CREATE TABLE short_calls 
(
    caller_id      INTEGER,
    call_timestamp TIMESTAMP,
    call_duration  INTEGER
);

CREATE TABLE long_calls 
(
    caller_id      INTEGER,
    call_timestamp TIMESTAMP,
    call_duration  INTEGER
);

INSERT INTO all_calls (caller_id, call_timestamp, call_duration, call_format)
SELECT caller_id, call_timestamp, call_duration, call_format
FROM calls
WHERE call_format IN ('tlk','txt','pic') AND DATE_TRUNC('day', call_timestamp) = DATE_TRUNC('day', NOW());

INSERT INTO police_record_calls (caller_id, call_timestamp, recipient_caller)
SELECT caller_id, call_timestamp, recipient_caller
FROM calls
WHERE call_format IN ('tlk','txt') AND DATE_TRUNC('day', call_timestamp) = DATE_TRUNC('day', NOW());

INSERT INTO short_calls (caller_id, call_timestamp, call_duration)
SELECT caller_id, call_timestamp, call_duration
FROM calls
WHERE call_duration < 50 AND call_type = 'tlk' AND DATE_TRUNC('day', call_timestamp) = DATE_TRUNC('day', NOW());

INSERT INTO long_calls (caller_id, call_timestamp, call_duration)
SELECT caller_id, call_timestamp, call_duration
FROM calls
WHERE call_duration >= 50 AND call_type = 'tlk' AND DATE_TRUNC('day', call_timestamp) = DATE_TRUNC('day', NOW());