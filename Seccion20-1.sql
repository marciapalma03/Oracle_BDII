CREATE TABLE emp AS
SELECT * 
FROM employees;

CREATE TABLE dept AS
SELECT *
FROM departments;

WITH
keyed AS 
(
    SELECT
    tc.constraint_name,
    tc.constraint_type,
    kcu.column_name,
    kcu.ordinal_position AS column_position
    FROM information_schema.table_constraints tc
    JOIN information_schema.key_column_usage kcu
    ON  kcu.constraint_catalog = tc.constraint_catalog
    AND kcu.constraint_schema  = tc.constraint_schema
    AND kcu.constraint_name    = tc.constraint_name
    AND kcu.table_schema       = tc.table_schema
    AND kcu.table_name         = tc.table_name
    WHERE tc.table_schema = 'public'
    AND tc.table_name  = 'job_history'
    AND tc.constraint_type IN ('PRIMARY KEY','FOREIGN KEY','UNIQUE')
),
notnulls AS 
(
    SELECT
    ('nn_' || c.table_name || '_' || c.column_name) AS constraint_name,
    'NOT NULL'        AS constraint_type,
    c.column_name,
    c.ordinal_position AS column_position
    FROM information_schema.columns c
    WHERE c.table_schema = 'public'
    AND c.table_name  = 'job_history'
    AND c.is_nullable = 'NO'
)
SELECT *
FROM keyed
UNION ALL
SELECT *
FROM notnulls
ORDER BY column_position, constraint_type, constraint_name;

