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

-- 1. List the following details of each employee: employee number, last name, first name, gender, and salary.

select emp.emp_no, emp.first_name, emp.last_name, emp.gender, sal.salary 
from employees as emp
INNER JOIN salaries AS sal ON
emp.emp_no = sal.emp_no;

-- 2. List employees who were hired in 1986.

select * from employees where hire_date >= '1986/1/1' and hire_date <= '1987/1/1';

-- 3. List the manager of each department with the following information: 
-- department number, department name, the manager's employee number, 
-- last name, first name, and start and end employment dates.

select * from dept_manager;
select * from departments;

select dm.dept_no, ds.dept_name,dm.emp_no, emp.first_name, emp.last_name, dm.from_date, dm.to_date 
from dept_manager as dm
INNER JOIN departments as ds
ON dm.dept_no = ds.dept_no
LEFT JOIN employees as emp
ON dm.emp_no = emp.emp_no;

-- 4. List the department of each employee with the following information: 
-- 	employee number, last name, first name, and department name.
select * from employees;
select * from dept_emp;
select * from departments;

select de.emp_no, emp.last_name, emp.first_name, ds.dept_name
from dept_emp as de
left join employees as emp
on de.emp_no = emp.emp_no
left join departments as ds
on de.dept_no = ds.dept_no;
-- order by de.emp_no asc;

-- 5. List all employees whose first name is "Hercules" and last names begin with "B."

Select * from employees where first_name = 'Hercules' and last_name like 'B%';

-- 6. List all employees in the Sales department, including their employee number, 
-- last name, first name, and department name.
select * from employees;
select * from dept_emp;
select * from departments;

select de.emp_no, emp.last_name, emp.first_name, ds.dept_name
from dept_emp as de
left join employees as emp
on de.emp_no = emp.emp_no
left join departments as ds
on de.dept_no = ds.dept_no
where dept_name = 'Sales';

-- 7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.

select de.emp_no, emp.last_name, emp.first_name, ds.dept_name
from dept_emp as de
left join employees as emp
on de.emp_no = emp.emp_no
left join departments as ds
on de.dept_no = ds.dept_no
where dept_name = 'Sales' or dept_name = 'Development';

-- 8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
 Select last_name, count(*)
 From employees
 Group By last_name
 Order by count desc;
--  Order by count asc;

-- ## Bonus (Optional)

-- Take the following steps to generate a visualization of the data:
-- 1. Import the SQL database into Pandas. (Yes, you could read the CSVs 
-- directly in Pandas, but you are, after all, trying to prove your technical mettle.)
-- This step may require some research. Feel free to use the code below to get started. 
-- Be sure to make any necessary modifications for your username, password, host, port, and database name:

--    ```sql
--    from sqlalchemy import create_engine
--    engine = create_engine('postgresql://localhost:5432/<your_db_name>')
--    connection = engine.connect()
--    ```

-- * Consult [SQLAlchemy documentation](https://docs.sqlalchemy.org/en/latest/core/engines.html#postgresql) for more information.

-- 2. Create a histogram to visualize the most common salary ranges for employees.

-- 3. Create a bar chart of average salary by title.