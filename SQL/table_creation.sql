--employees table
CREATE TABLE titles (emp_title_id CHAR(5) UNIQUE NOT NULL,
					 title VARCHAR(30) NOT NULL,
					PRIMARY KEY(emp_title_id) );

CREATE TABLE departments (dept_no CHAR(4),
					 dept_name VARCHAR(30) UNIQUE NOT NULL,
					 PRIMARY KEY(dept_no) );

CREATE TABLE employees (emp_no INT NOT NULL UNIQUE,
					   emp_title_id CHAR(5) NOT NULL ,
					   birth_date date,
					   first_name VARCHAR(30) NOT NULL,
					   last_name VARCHAR(30),
					   sex CHAR(1) NOT NULL,
					   hire_date date NOT NULL,
					   PRIMARY KEY(emp_no),
					   FOREIGN KEY (emp_title_id) REFERENCES titles(emp_title_id) );
					 
--Based on our Jupyter analysis, number of employees in this table exceed number of employees at employees table. This means one employee can work at multiple departments.
CREATE TABLE dept_manager (dept_no CHAR(4),
						   emp_no INT,
						  FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
						  FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
						  PRIMARY KEY (dept_no,emp_no));


CREATE TABLE dept_emp (emp_no INT,
					   dept_no CHAR(4),
						
						FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
						FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
						PRIMARY KEY (dept_no,emp_no));
						
CREATE TABLE salaries (emp_no INT,
					 salary INT NOT NULL,
					  FOREIGN KEY (emp_no) REFERENCES employees(emp_no) );