SELECT employees.first_name, employees.lastnamedepartments.dept_no, departments.dept_name 
FROM dept_emp
LEFT JOIN departments
ON departments.dept_no = dept_emp.dept_no
LEFT JOIN 
ON dept_emp.emp_no = employees.emp_no
