--Privilegios del sistema
CREATE USER scott WITH PASSWORD 'ur35scott';

ALTER USER scott WITH PASSWORD 'imscott35';

GRANT CONNECT ON DATABASE proyecto TO scott;

GRANT CREATE ON SCHEMA public TO scott;

CREATE USER steven_king WITH PASSWORD '123456';

GRANT SELECT (salary) ON employees TO steven_king;

GRANT UPDATE (salary)
ON employees TO steven_king;

CREATE USER alice WITH PASSWORD '654321';

CREATE SCHEMA AUTHORIZATION alice;

CREATE TABLE alice.departments 
(
    department_id INT PRIMARY KEY,
    department_name VARCHAR(100)
);

GRANT SELECT ON alice.departments TO PUBLIC;