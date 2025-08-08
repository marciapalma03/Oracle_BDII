--Funciones
CREATE ROLE manager;

GRANT CREATE ON SCHEMA public TO manager;

CREATE USER jennifer_cho WITH PASSWORD '2468';

GRANT manager TO jennifer_cho;

GRANT SELECT ON clients TO PUBLIC;

GRANT UPDATE (first_name, last_name)
ON clients
TO jennifer_cho, manager;

CREATE SCHEMA IF NOT EXISTS scott_king;

CREATE TABLE scott_king.clients 
(
    client_number INTEGER PRIMARY KEY,
    first_name    VARCHAR(50),
    last_name     VARCHAR(50)
);

INSERT INTO scott_king.clients (client_number, first_name, last_name)
VALUES 
(1, 'Scott', 'King'),
(2, 'Jennifer', 'Cho');

GRANT SELECT ON scott_king.clients TO PUBLIC;
GRANT UPDATE (first_name, last_name) ON scott_king.clients TO jennifer_cho, manager;

SELECT *
FROM scott_king.clients;

CREATE USER scott_king WITH PASSWORD '13579';

GRANT SELECT, INSERT
ON clients
TO scott_king
WITH GRANT OPTION;

CREATE USER jason_tsang WITH PASSWORD '78910';

CREATE SCHEMA AUTHORIZATION jason_tsang;

REVOKE SELECT, INSERT
ON clients
FROM scott_king;

CREATE SCHEMA IF NOT EXISTS hq;

CREATE TABLE IF NOT EXISTS hq.emp 
(
    emp_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50)
);

CREATE OR REPLACE VIEW hq_emp AS
SELECT * FROM hq.emp;

GRANT SELECT ON hq_emp TO PUBLIC;

SELECT * FROM hq_emp;