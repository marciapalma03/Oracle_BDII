--Conversion de datos de fecha
SELECT TO_CHAR(hire_date, 'Month DD, YYYY')
FROM employees;

SELECT TO_CHAR(hire_date, 'FMMonth DD, YYYY')
FROM employees;

SELECT TO_CHAR(hire_date, 'FMMonth DDth, YYYY')
FROM employees;

SELECT TO_CHAR(hire_date, 'FMDay DDth Mon, YYYY')
FROM employees;

SELECT TO_CHAR(hire_date, 'FMDay DDth Mon, YYYY')
FROM employees;

SELECT TO_CHAR(hire_date, 'FMDay, DDth "of" Month, YYYY')
FROM employees;

--Conversion de datos de hora
SELECT TO_CHAR(CURRENT_TIMESTAMP, 'HH:MI');

SELECT TO_CHAR(CURRENT_TIMESTAMP, 'HH12:MI PM');

SELECT TO_CHAR(CURRENT_TIMESTAMP, 'HH12:MI:SS PM');

--Conversion de datos numericos
SELECT TO_CHAR(salary, '$99,999') AS "Salary"
FROM employees;

SELECT TO_CHAR(3000, '$99999.99');

SELECT TO_CHAR(4500, '99,999');

SELECT TO_CHAR(9000, '99,999.99');

SELECT TO_CHAR(4422, '0,009,999');

--Conversion de caracteres
SELECT TO_NUMBER('5,320', '9,999') AS "Number";

SELECT last_name, TO_NUMBER(bonus, '9999') AS "Bonus"
FROM employees
WHERE department_id = 80;

SELECT TO_DATE('May10,1989', 'MonDD,YYYY') AS "Convert";

--Reglas del modificador 
SELECT TO_DATE('Sep 07, 1965', 'MonDD, YYYY') AS "Date";

SELECT TO_DATE('July312004', 'MonthDDYYYY') AS "Date";

SELECT TO_DATE('June 19, 1990', 'Month DD, YYYY') AS "Date";

SELECT TO_DATE('27-Oct-95', 'DD-Mon-YY') AS "Date";

--Consulta
SELECT last_name, TO_CHAR(hire_date, 'DD-Mon-YY')
FROM employees
WHERE hire_date < TO_DATE('01-Jan-90', 'DD-Mon-YY');