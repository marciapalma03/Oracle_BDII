--Llaves primarias y foraneas
CREATE TABLE consumers 
(
    client_number NUMERIC(4) CONSTRAINT consumers_client_num_pk PRIMARY KEY,
    first_name VARCHAR(14),
    last_name VARCHAR(13)
);

CREATE TABLE consumers2 
(
    client_number NUMERIC(4),
    first_name VARCHAR(14),
    last_name VARCHAR(13),
    CONSTRAINT consumers_client_num_pk2 PRIMARY KEY (client_number)
);

CREATE TABLE copy_job_history 
(
    employee_id NUMERIC(6,0),
    start_date DATE,
    job_id VARCHAR(10),
    department_id NUMERIC(4,0),
    CONSTRAINT copy_jhist_id_st_date_pk PRIMARY KEY (employee_id, start_date)
);

CREATE TABLE copy_employees 
(
    employee_id NUMERIC(6,0) CONSTRAINT copy_emp_pk PRIMARY KEY,
    first_name VARCHAR(20),
    last_name VARCHAR(25),
    department_id INTEGER CONSTRAINT c_emps_dept_id_fk
    REFERENCES departments(department_id),
    email VARCHAR(25)
);

CREATE TABLE copy_employees2 
(
    employee_id NUMERIC(6,0) CONSTRAINT copy_emp_pk2 PRIMARY KEY,
    first_name VARCHAR(20),
    last_name VARCHAR(25),
    department_id INTEGER,
    email VARCHAR(25),
    CONSTRAINT c_emps_dept_id_fk2 FOREIGN KEY (department_id)
    REFERENCES departments(department_id)
);

ALTER TABLE copy_departments
ADD CONSTRAINT copy_departments_pk PRIMARY KEY (department_id);

CREATE TABLE copy_employees3 
(
    employee_id NUMERIC(6,0) CONSTRAINT copy_emp_pk3 PRIMARY KEY,
    first_name VARCHAR(20),
    last_name VARCHAR(25),
    department_id INTEGER,
    email VARCHAR(25),
    CONSTRAINT cdept_dept_id_fk3 FOREIGN KEY (department_id)
    REFERENCES copy_departments(department_id) ON DELETE CASCADE
);

CREATE TABLE copy_employees4 
(
    employee_id NUMERIC(6,0) CONSTRAINT copy_emp_pk4 PRIMARY KEY,
    first_name VARCHAR(20),
    last_name VARCHAR(25),
    department_id INTEGER,
    email VARCHAR(25),
    CONSTRAINT cdept_dept_id_fk4 FOREIGN KEY (department_id)
        REFERENCES copy_departments(department_id) ON DELETE SET NULL
);

CREATE TABLE copy_job_history2 
(
    employee_id NUMERIC(6,0),
    start_date DATE,
    end_date DATE,
    job_id VARCHAR(10),
    department_id NUMERIC(4,0),
    CONSTRAINT cjhist_emp_id_st_date_pk PRIMARY KEY (employee_id, start_date),
    CONSTRAINT cjhist_end_ck CHECK (end_date > start_date)
);