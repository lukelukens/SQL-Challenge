DROP TABLE departments;
DROP TABLE dept_emp;
DROP TABLE dept_manager;
DROP TABLE employees;
DROP TABLE salaries;
DROP TABLE titles;

CREATE TABLE departments (
	dept_no varchar(10) PRIMARY KEY not null,
	dept_name varchar(30) not null
);

CREATE TABLE employees (
	emp_no integer PRIMARY KEY not null,
	birth_date date not null,
	first_name varchar (20) not null,
	last_name varchar (20) not null,
	gender varchar (10) not null,
	hire_date date not null
);

CREATE TABLE dept_emp (
	emp_no integer not null,
	dept_no varchar(10) not null,
	from_date date not null,
	to_date date not null,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no) 
);

CREATE TABLE dept_manager (
	dept_no varchar(10) not null,
	emp_no integer not null,
	from_date date not null,
	to_date date not null,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no) 
);

CREATE TABLE salaries (
	emp_no integer not null,
	salary integer not null,
	from_date date not null,
	to_date date not null,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

CREATE TABLE titles (
	emp_no integer not null,
	title varchar (25) not null,
	from_date date not null,
	to_date date not null,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);