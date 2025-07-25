--Estructura de la tabla
SELECT column_name, data_type, is_nullable
FROM information_schema.columns
WHERE table_name = 'departments';

--Operador de concatenacion
SELECT CONCAT(department_id, department_name)
FROM departments;

--Concatenacion con espacio
SELECT department_id || ' ' || department_name
FROM departments;

--Concatenacion con espacio y alias
SELECT department_id || ' ' || department_name AS department_info
FROM departments;

SELECT first_name || ' ' || last_name AS employee_name
FROM employees;

--Concatenacion y valores literales
SELECT last_name || ' has a monthly salary of ' || salary || ' dollars.' AS pay 
FROM employees;

--Concatenacion de numeros
SELECT last_name || ' has a ' || 1 || ' year salary of ' || salary*12 || ' dollars.' AS pay
FROM employees;

--Uso de DISTINCT para eliminar filas duplicadas
SELECT department_id 
FROM employees;

SELECT DISTINCT department_id
FROM employees;