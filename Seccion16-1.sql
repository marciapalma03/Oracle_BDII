--Creacion de secuencias
CREATE SEQUENCE runner_id_seq
INCREMENT BY 1
START WITH 1
MAXVALUE 50000
NO CYCLE;

SELECT 
sequencename AS sequence_name,
min_value,
max_value,
increment_by,
last_value AS last_number
FROM pg_sequences
WHERE schemaname = 'public';

CREATE SEQUENCE departments_seq
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;

INSERT INTO departments (department_id, department_name, location_id)
VALUES (nextval('departments_seq'), 'Support', 2500);

CREATE TABLE runners 
(
    runner_id NUMERIC(6,0) CONSTRAINT runners_id_pk PRIMARY KEY,
    first_name VARCHAR(30),
    last_name VARCHAR(30)
);

INSERT INTO runners (runner_id, first_name, last_name)
VALUES (nextval('runner_id_seq'), 'Joanne', 'Everely');

INSERT INTO runners (runner_id, first_name, last_name)
VALUES (nextval('runner_id_seq'), 'Adam', 'Curtis');

SELECT runner_id, first_name, last_name
FROM runners;

SELECT nextval('runner_id_seq');

SELECT 
sequencename AS sequence_name,
min_value,
max_value,
last_value AS "Next number"
FROM pg_sequences
WHERE schemaname = 'public' AND sequencename = 'runner_id_seq';

ALTER SEQUENCE runner_id_seq
INCREMENT BY 1
MAXVALUE 999999
NO CYCLE;

ALTER SEQUENCE runner_id_seq
INCREMENT BY 1
MAXVALUE 90
NO CYCLE;