-- Create tables in Postrges

CREATE TABLE departments (
  dept_no VARCHAR(30) NOT NULL,
  dept_name VARCHAR(30) NOT NULL,
  PRIMARY KEY (dept_no)
);
SELECT * FROM departments;

DROP TABLE dept_emp
CREATE TABLE dept_emp (
  emp_no INTEGER,
  dept_no VARCHAR(30),
  from_date VARCHAR(30),
  to_date VARCHAR(30)
  PRIMARY KEY (dept_no)
);
SELECT * FROM dept_emp;

DROP TABLE dept_manager;
CREATE TABLE dept_manager (
  dept_no VARCHAR(30),
  emp_no INTEGER,
  from_date VARCHAR(30),
  to_date VARCHAR(30) 
  PRIMARY KEY (emp_no)
);
SELECT * FROM dept_manager;

DROP TABLE employees;
CREATE TABLE employees (
  emp_no INTEGER,
  birth_date VARCHAR(30),
  first_name VARCHAR(30),
  lastname VARCHAR(30),
  gender VARCHAR(30),
  hire_date VARCHAR(30)
  PRIMARY KEY (emp_no)
);
SELECT * FROM employees;

DROP TABLE salaries;
CREATE TABLE salaries (
  emp_no INTEGER,
  salary INTEGER,
  from_date VARCHAR(30),
  to_date VARCHAR(30),
  PRIMARY KEY (emp_no)
);
SELECT * FROM salaries;

DROP TABLE titles;
CREATE TABLE titles (
  emp_no INTEGER,
  title VARCHAR(30), 
  from_date VARCHAR(30),
  to_date VARCHAR(30), 
  PRIMARY KEY (emp_no)
);
SELECT * FROM titles;

-- 1. List the following details of each employee: employee number, last name, first name, gender, and salary.
SELECT employees.emp_no, employees.first_name, employees.lastname, employees.gender, salaries.salary
FROM employees
LEFT JOIN salaries
ON employees.emp_no = salaries.emp_no

-- 2. List employees who were hired in 1986.
DROP TABLE employees;
CREATE TABLE employees (
  emp_no INTEGER,
  birth_date VARCHAR(30),
  first_name VARCHAR(30),
  lastname VARCHAR(30),
  gender VARCHAR(30),
  hire_date INTEGER
);
SELECT * FROM employees WHERE LEFT(hire_date,4) = 1986


-- 3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name, and start and end employment dates.

SELECT departments.dept_no, departments.dept_name, dept_manager.emp_no, dept_manager.from_date, dept_manager.to_date, employees.first_name, employees.lastname
FROM dept_manager
LEFT JOIN departments
ON dept_manager.dept_no = dept_manager.dept_no
LEFT JOIN 
ON dept_manager.dept_no = employees.emp_no

-- 4. List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT employees.first_name, employees.lastname, departments.dept_no, departments.dept_name 
FROM dept_emp
LEFT JOIN departments
ON departments.dept_no = dept_emp.dept_no
LEFT JOIN 
ON dept_emp.emp_no = employees.emp_no

-- 5. List all employees whose first name is "Hercules" and last names begin with "B."
SELECT *
FROM employees
WHERE
	first_name = 'Hercules'
	OR LEFT(lastname, 1) = 'B';
	
-- 6. List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT employees.first_name, employees.lastname, employees.emp_no, departments.dept_no, departments.dept_name 
FROM dept_emp
LEFT JOIN departments
ON departments.dept_no = dept_emp.dept_no
WHERE
    dept_name = "Sales"

--7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT employees.first_name, employees.lastname, employees.emp_no, departments.dept_no, departments.dept_name 
FROM dept_emp
LEFT JOIN departments
ON departments.dept_no = dept_emp.dept_no
WHERE
    dept_name = "Sales"
    AND dept_name = "Development"

-- 8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT employees.lastname, COUNT(employees.lastname) AS "name count"
FROM employees
GROUP BY employees.lastname
ORDER BY "name count" DESC;
