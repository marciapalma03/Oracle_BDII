CREATE TABLE employees
(
    employee_id INTEGER,
    first_name VARCHAR(20),
    last_name VARCHAR(25) NOT NULL,
    email VARCHAR(25) NOT NULL,
    phone_number VARCHAR(20),
    hire_date DATE NOT NULL,
    job_id VARCHAR(10) NOT NULL,
    salary NUMERIC(8,2),
    comission_pct NUMERIC(5,2),
    manager_id INTEGER,
    department_id INTEGER,
    bonus VARCHAR(5),
    CONSTRAINT emp_salary_min CHECK (salary > 0),
    CONSTRAINT emp_id_pk PRIMARY KEY (employee_id),
    CONSTRAINT emp_email_uk UNIQUE (email)
);

ALTER TABLE employees RENAME COLUMN comission_pct TO commission_pct;

INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id)
VALUES(100,'Steven','King','SKING','515.123.4567','1987-06-17','AD_PRES',24000,null,null,90);

INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id)
VALUES(101,'Neena','Kochhar','NKOCHHAR','515.123.4568','1989-09-21','AD_VP',17000,null,100,90);

INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id)
VALUES(102,'Lex','De Haan','LDEHAAN','515.123.4569','1993-01-13','AD_VP',17000,null,100,90);

INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id)
VALUES(200,'Jennifer','Whalen','JWHALEN','515.123.4444','1987-09-17','AD_ASST',4400,null,101,10);

INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id)
VALUES(205,'Shelley','Higgins','SHIGGINS','515.123.8080','1994-06-07','AC_MGR',12000,null,101,110);

INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id)
VALUES(206,'William','Gietz','WGIETZ','515.123.8181','1994-06-07','AC_ACCOUNT',8300,null,205,110);

INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id, bonus)
VALUES(149,'Eleni','Zlotkey','EZLOTKEY','011.44.1344.429018','2000-01-29','SA_MAN',10500,0.2,100,80,'1500');

INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id, bonus)
VALUES(174,'Ellen','Abel','EABEL','011.44.1644.429267','1996-05-11','SA_REP',11000,0.3,149,80,'1700');

INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id, bonus)
VALUES(176,'Jonathon','Taylor','JTAYLOR','011.44.1644.429265','1998-03-24','SA_REP',8600,0.2,149,80,'1250');

INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id)
VALUES(178,'Kimberely','Grant','KGRANT','011.44.1644.429263','1999-05-24','SA_REP',7000,0.15,149,null);

INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id)
VALUES(124,'Kevin','Mourgos','KMOURGOS','650.123.5234','1999-11-16','ST_MAN',5800,null,100,50);

INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id)
VALUES(141,'Trenna','Rajs','TRAJS','650.121.8009','1995-10-17','ST_CLERK',3500,null,124,50);

INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id)
VALUES(142,'Curtis','Davies','CDAVIES','650.121.2994','1997-01-29','ST_CLERK',3100,null,124,50);

INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id)
VALUES(143,'Randall','Matos','RMATOS','650.121.2874','1998-03-15','ST_CLERK',2600,null,124,50);

INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id)
VALUES(144,'Peter','Vargas','PVARGAS','650.121.2004','1998-07-09','ST_CLERK',2500,null,124,50);

INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id)
VALUES(103,'Alexander','Hunold','AHUNOLD','590.423.4567','1990-01-03','IT_PROG',9000,null,102,60);

INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id)
VALUES(104,'Bruce','Ernst','BERNST','590.423.4568','1991-05-21','IT_PROG',6000,null,103,60);

INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id)
VALUES(107,'Diana','Lorentz','DLORENTZ','590.423.5567','1999-02-07','IT_PROG',4200,null,103,60);

INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id)
VALUES(201,'Michael','Hartstein','MHARTSTE','515.123.5555','1996-02-17','MK_MAN',13000,null,100,20);

INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id)
VALUES(202,'Pat','Fay','PFAY','603.123.6666','1997-08-17','MK_REP',6000,null,201,20);

--Sentencia SELECT basica
SELECT *
FROM employees;

SELECT first_name
FROM employees;

--Sentencia SELECT con condicion
SELECT first_name, last_name, job_id
FROM employees
WHERE job_id = 'SA_REP';