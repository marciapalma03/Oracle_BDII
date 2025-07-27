CREATE TABLE jobs (
    job_id      VARCHAR(10) PRIMARY KEY,
    job_title   VARCHAR(35) NOT NULL,
    min_salary  NUMERIC(6,0),
    max_salary  NUMERIC(6,0)
);

INSERT INTO jobs (job_id, job_title, min_salary, max_salary)
VALUES ('AD_PRES','President',20000,40000);

INSERT INTO jobs (job_id, job_title, min_salary, max_salary)
VALUES ('AD_VP','Administration Vice President',15000,30000);

INSERT INTO jobs (job_id, job_title, min_salary, max_salary)
VALUES ('AD_ASST','Administration Assistant',3000,6000);

INSERT INTO jobs (job_id, job_title, min_salary, max_salary)
VALUES ('AC_MGR','Accounting Manager',8200,16000);

INSERT INTO jobs (job_id, job_title, min_salary, max_salary)
VALUES ('AC_ACCOUNT','Public Accountant',4200,9000);

INSERT INTO jobs (job_id, job_title, min_salary, max_salary)
VALUES ('SA_MAN','Sales Manager',10000,20000);

INSERT INTO jobs (job_id, job_title, min_salary, max_salary)
VALUES ('SA_REP','Sales Representative',6000,12000);

INSERT INTO jobs (job_id, job_title, min_salary, max_salary)
VALUES ('ST_MAN','Stock Manager',5500,8500);

INSERT INTO jobs (job_id, job_title, min_salary, max_salary)
VALUES ('ST_CLERK','Stock Clerk',2000,5000);

INSERT INTO jobs (job_id, job_title, min_salary, max_salary)
VALUES ('IT_PROG','Programmer',4000,10000);

INSERT INTO jobs (job_id, job_title, min_salary, max_salary)
VALUES ('MK_MAN','Marketing Manager',9000,15000);

INSERT INTO jobs (job_id, job_title, min_salary, max_salary)
VALUES ('MK_REP','Marketing Representative',4000,9000);

--Union natural
SELECT first_name, last_name, job_id, job_title
FROM employees NATURAL JOIN jobs
WHERE department_id > 80;

SELECT department_name, city
FROM departments NATURAL JOIN locations;

--Union cruzada
SELECT last_name, department_name
FROM employees CROSS JOIN departments;