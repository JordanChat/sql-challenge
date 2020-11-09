DROP TABLE if exists departments;
DROP TABLE if exists dept_emp;
DROP TABLE if exists dept_manager;
DROP TABLE if exists employees;
DROP TABLE if exists salaries;
DROP TABLE if exists titles;

CREATE TABLE departments (
    dept_no VARCHAR(30) PRIMARY KEY  NOT NULL,
    dept_name VARCHAR(40)   NOT NULL
);

CREATE TABLE employees (
    emp_no INT PRIMARY KEY  NOT NULL,
    title_id VARCHAR(30)   NOT NULL,
    birth_date DATE   NOT NULL,
    first_name VARCHAR(50)   NOT NULL,
    last_name VARCHAR(50)   NOT NULL,
    sex VARCHAR(30)   NOT NULL,
    hire_date DATE   NOT NULL
);

CREATE TABLE dept_emp (
    "emp_no" INT   NOT NULL,
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
    "dept_no" VARCHAR(30)   NOT NULL,
    FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);

CREATE TABLE "dept_manager" (
    "dept_no" VARCHAR(30)   NOT NULL,
    FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
    "emp_no" INT   NOT NULL,
    FOREIGN KEY (emp_no) REFERENCES employees (emp_no)
);

CREATE TABLE "salaries" (
    "emp_no" INT   NOT NULL,
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
    "salary" INT   NOT NULL
);

CREATE TABLE "titles" (
    "title_id" VARCHAR(30)   NOT NULL,
    "title" VARCHAR(30)   NOT NULL
);