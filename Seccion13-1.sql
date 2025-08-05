CREATE TABLE my_cd_collection
(cd_numberNUMBER(3),
title VARCHAR2(20),
artist VARCHAR2(20),
purchase_dateDATE DEFAULT SYSDATE);

CREATE TABLE my_friends
(first_name VARCHAR2(20),
last_nameVARCHAR2(30),
email VARCHAR2(30),
phone_numVARCHAR2(12),
birth_date DATE);

CREATE TABLE emp_load
(employee_number CHAR(5),
employee_dob CHAR(20),
employee_last_name CHAR(20),
employee_first_name CHAR(15),
employee_middle_name CHAR(15),
employee_hire_date DATE)
ORGANIZATION EXTERNAL
(TYPE ORACLE_LOADER 
DEFAULT DIRECTORY def_dir1 
ACCESS PARAMETERS 
(RECORDS DELIMITED BY NEWLINE 
FIELDS (employee_number CHAR(2),
employee_dob CHAR(20), 
employee_last_name CHAR(18), 
employee_first_name CHAR(11), 
employee_middle_name CHAR(11), 
employee_hire_date CHAR(10) date_format DATE mask 
"mm/dd/yyyy"))
LOCATION ('info.dat'));

SELECT table_name, status 
FROM USER_TABLES;

SELECT table_name, status 
FROM ALL_TABLES;

SELECT *
FROM user_indexes;

SELECT *
FROM user_objects
WHERE object_type = 'SEQUENCE';