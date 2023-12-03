-- Data Analysis
-- List the employee number, last name, first name, sex, and salary of each employee.
SELECT salaries.emp_no, employees.last_name, employees.first_name, employees.sex, salaries.salary
FROM employees
INNER JOIN salaries
ON salaries.emp_no = employees.emp_no
ORDER BY emp_no


-- List the first name, last name, and hire date for the employees who were hired in 1986.
SELECT emp_no, first_name, last_name, hire_date 
FROM employees 
WHERE hire_date BETWEEN '01-01-1986' AND '12-31-1986'
ORDER BY hire_date, emp_no

-- List the manager of each department along with their department number, department name, employee number, last name, and first name.
SELECT d_m.dept_no, d.dept_name, d_m.emp_no, e.last_name, e.first_name
FROM dept_manager AS d_m
INNER JOIN departments AS d
ON d_m.dept_no= d.dept_no
INNER JOIN employees AS e
ON d_m.emp_no = e.emp_no
ORDER BY dept_name


-- List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
SELECT d_e.dept_no, e.emp_no, e.last_name, e.first_name,d.dept_name
FROM employees AS e
INNER JOIN dept_emp AS d_e
ON e.emp_no = d_e.emp_no
INNER JOIN departments AS d
ON d_e.dept_no = d.dept_no
ORDER BY dept_name, last_name


-- List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
SELECT e.last_name, e.first_name, e.sex
FROM employees AS e
WHERE (e.first_name = 'Hercules') AND e.last_name LIKE 'B%'
ORDER BY last_name


-- List each employee in the Sales department, including their employee number, last name, and first name.
SELECT e.emp_no, e.last_name, e.first_name,d.dept_name
FROM employees AS e
INNER JOIN dept_emp AS d_e
ON e.emp_no = d_e.emp_no
INNER JOIN departments AS d
ON d_e.dept_no = d.dept_no
WHERE (d.dept_name) = 'Sales'
ORDER BY last_name, first_name

-- List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name,d.dept_name
FROM employees AS e
INNER JOIN dept_emp AS d_e
ON e.emp_no = d_e.emp_no
INNER JOIN departments AS d
ON d_e.dept_no = d.dept_no
WHERE (d.dept_name) IN ('Sales', 'Development')
ORDER By dept_name,last_name, first_name

-- List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
SELECT last_name, COUNT(last_name)
FROM employees
GROUP BY last_name 
ORDER BY COUNT(last_name) DESC
