--Comando ALTER
ALTER TABLE employees
ALTER COLUMN email SET NOT NULL;

ALTER TABLE employees
ADD CONSTRAINT emp_email_nn CHECK (email IS NOT NULL);

ALTER TABLE copy_departments
DROP CONSTRAINT copy_departments_pk CASCADE;

ALTER TABLE copy_employees
DROP CONSTRAINT c_emps_dept_id_fk;

ALTER TABLE copy_departments
ADD CONSTRAINT c_dept_dept_id_pk PRIMARY KEY (department_id);

SELECT con.conname AS constraint_name, rel.relname AS table_name,
CASE con.contype
    WHEN 'p' THEN 'PRIMARY KEY'
    WHEN 'f' THEN 'FOREIGN KEY'
    WHEN 'u' THEN 'UNIQUE'
    WHEN 'c' THEN 'CHECK'
    ELSE con.contype
END AS constraint_type, 'ENABLED' AS status
FROM pg_constraint con
JOIN pg_class rel ON rel.oid = con.conrelid
JOIN pg_namespace nsp ON nsp.oid = rel.relnamespace
WHERE rel.relname = 'copy_employees' AND nsp.nspname = 'public';