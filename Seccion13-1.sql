SELECT column_name, data_type, is_nullable
FROM information_schema.columns
WHERE table_name = 'jobs';

--Funcion CREATE
CREATE TABLE my_cd_collection 
(
    cd_number NUMERIC(3),
    title VARCHAR(20),
    artist VARCHAR(20),
    purchase_date DATE DEFAULT CURRENT_DATE
);

CREATE TABLE my_friends 
(
    first_name VARCHAR(20),
    last_name VARCHAR(30),
    email VARCHAR(30),
    phone_num VARCHAR(12),
    birth_date DATE
);

--Tablas externas
CREATE EXTENSION IF NOT EXISTS file_fdw;

CREATE SERVER file_server FOREIGN DATA WRAPPER file_fdw;

CREATE FOREIGN TABLE emp_load 
(
    employee_number CHAR(5),
    employee_dob CHAR(20),
    employee_last_name CHAR(20),
    employee_first_name CHAR(15),
    employee_middle_name CHAR(15),
    employee_hire_date DATE
)
SERVER file_server
OPTIONS (filename 'C:\Users\marci\Downloads\imc_personas.csv', format 'csv', delimiter ',', header 'false');

--Datos de las tablas
SELECT tablename AS table_name, 'ACTIVE' AS status
FROM pg_tables
WHERE schemaname = current_schema();

SELECT table_name, 'ACTIVE' AS status
FROM information_schema.tables
WHERE table_schema NOT IN ('pg_catalog', 'information_schema');

SELECT schemaname AS schema_name, tablename AS table_name, indexname AS index_name, indexdef AS index_definition
FROM pg_indexes
WHERE schemaname = 'public';

SELECT c.relname AS object_name, 'SEQUENCE' AS object_type
FROM pg_class c
JOIN pg_namespace n ON n.oid = c.relnamespace
WHERE c.relkind = 'S' AND n.nspname = 'public';