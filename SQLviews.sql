-- 1. List the following details of each employee: employee number, last name, first name, sex, and salary.
-- join employees and salary

SELECT employees.emp_no, employees.last_name, employees.first_name, employees.sex, salaries.salary 
FROM employees
INNER JOIN salaries ON employees.emp_no = salaries.emp_no

--2. List first name, last name, and hire date for employees who were hired in 1986.
-- use employees table, where hire date = 1986

SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date > '1986-01-01'
	AND hire_date < '1986-12-31'

--3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
-- join dept_manager, departments
SELECT dept_manager.dept_no, departments.dept_name , dept_manager.emp_no  
FROM dept_manager
INNER JOIN departments ON dept_manager.dept_no = departments.dept_no 

--4.List the department of each employee with the following information: employee number, last name, first name, and department name.
--Steps:

-- Step 1: UNION dept_manager and dept_emp. May even create "all_employees" View
CREATE VIEW all_employees AS
SELECT * FROM dept_manager
UNION ALL
SELECT dept_no, emp_no FROM dept_emp

-- Step 2: INNER JOIN departments and "All Employees". May Create "All Employees Department" View

CREATE VIEW all_employees_dept AS
SELECT all_employees.dept_no , all_employees.emp_no, departments.dept_name 
FROM all_employees
INNER JOIN departments ON all_employees.dept_no = departments.dept_no

-- Step 3: Left Join employees table with View from Step 2
SELECT employees.emp_no, employees.last_name, employees.first_name, all_employees_dept.dept_name
FROM employees
LEFT JOIN all_employees_dept ON employees.emp_no = all_employees_dept.emp_no

--5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%'

--6. List all employees in the Sales department, including their employee number, last name, first name, and department name.
Select employees.emp_no, employees.last_name, employees.first_name, all_employees_dept.dept_name
from employees
LEFT JOIN all_employees_dept ON employees.emp_no = all_employees_dept.emp_no
WHERE dept_name = 'Sales'

--7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
Select employees.emp_no, employees.last_name, employees.first_name, all_employees_dept.dept_name
from employees
LEFT JOIN all_employees_dept ON employees.emp_no = all_employees_dept.emp_no
WHERE dept_name = 'Sales' OR dept_name = 'Development'

--8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT last_name, count(last_name)
FROM employees
GROUP BY last_name

SELECT AVG(salary)
FROM salaries

--9. Bonus View 1
CREATE VIEW emp_salary_vw AS
SELECT titles.title, salaries.salary
FROM employees
INNER JOIN titles on titles.emp_title_id = employees.emp_title_id
INNER JOIN salaries on employees.emp_no = salaries.emp_no

