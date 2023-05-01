-- Creation of tables for 09-SQL-Challenge

-- Drop table if exists first in the reverse order of dependency
-- So delete first tables which does not have any foreign key depedency
DROP TABLE IF EXISTS dept_emp;
DROP TABLE IF EXISTS dept_manager;
DROP TABLE IF EXISTS salaries;
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS titles;
DROP TABLE IF EXISTS departments;

-- Create table with least dependecny first
CREATE TABLE IF NOT EXISTS departments (
    dept_no   varchar   PRIMARY KEY,
    dept_name varchar   NOT NULL
);

CREATE TABLE IF NOT EXISTS titles (
    title_id varchar  PRIMARY KEY,
    title    varchar  NOT NULL
);

CREATE TABLE IF NOT EXISTS employees (
    emp_no       int     PRIMARY KEY,
    emp_title_id varchar NOT NULL,
    birth_date   date    NOT NULL,
    first_name   varchar NOT NULL,
    last_name    varchar NOT NULL,
    sex          varchar NOT NULL,
    hire_date    date    NOT NULL,
    CONSTRAINT fk_employees_emp_title_id 
        FOREIGN KEY (emp_title_id)
        REFERENCES titles(title_id)
);

CREATE TABLE IF NOT EXISTS salaries (
    emp_no int   PRIMARY KEY,
    salary int   NOT NULL,
    CONSTRAINT fk_salaries_emp_no 
        FOREIGN KEY (emp_no)
        REFERENCES employees(emp_no)
);

CREATE TABLE IF NOT EXISTS dept_manager (
    dept_no varchar  NOT NULL,
    emp_no  int      PRIMARY KEY,
    CONSTRAINT fk_dept_manager_dept_no 
        FOREIGN KEY (dept_no)
        REFERENCES departments(dept_no),
    CONSTRAINT fk_dept_manager_emp_no 
        FOREIGN KEY (emp_no)
        REFERENCES employees(emp_no)
);

CREATE TABLE IF NOT EXISTS dept_emp (
    emp_no  int       NOT NULL,
    dept_no varchar   NOT NULL,
    CONSTRAINT pk_dept_emp PRIMARY KEY (
        emp_no,
        dept_no
    ),
    CONSTRAINT fk_dept_emp_dept_no 
        FOREIGN KEY (dept_no)
        REFERENCES departments(dept_no),
    CONSTRAINT fk_dept_emp_emp_no 
        FOREIGN KEY (emp_no)
        REFERENCES employees(emp_no)
);

-- Populate the table starting with least dependency
-- For mac make sure all files are in /tmp directory as it gives permission problem
COPY departments  FROM '/tmp/departments.csv'  CSV HEADER;
COPY titles       FROM '/tmp/titles.csv'       CSV HEADER;
COPY employees    FROM '/tmp/employees.csv'    CSV HEADER;
COPY salaries     FROM '/tmp/salaries.csv'     CSV HEADER;
COPY dept_manager FROM '/tmp/dept_manager.csv' CSV HEADER;
COPY dept_emp     FROM '/tmp/dept_emp.csv'     CSV HEADER;

