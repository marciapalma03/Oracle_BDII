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