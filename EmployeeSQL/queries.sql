-- 1. List the employee number, last name, first name, sex, and salary of each employee.

SELECT employees.emp_no, employees.first_name, employees.last_name, salaries.salary
FROM employees
INNER JOIN salaries ON
employees.emp_no = salaries.emp_no;

-- 2. List the first name, last name, and hire date for the employees who were hired in 1986.

SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date LIKE '%1986';

-- 3. List the manager of each department along with their department number, department name, employee number, last name, and first name.

SELECT employees.first_name, employees.last_name, employees.emp_no, departments.dept_no, departments.dept_name
FROM employees
INNER JOIN dept_manager ON
employees.emp_no = dept_manager.emp_no
LEFT JOIN departments ON
dept_manager.dept_no = departments.dept_no;

-- 4. List the department number for each employee along with that employee’s employee number, last name, first name, and department name.

SELECT employees.first_name, employees.last_name, employees.emp_no, departments.dept_no, departments.dept_name
FROM employees
LEFT JOIN dept_emp ON
employees.emp_no = dept_emp.emp_no
LEFT JOIN departments ON
dept_emp.dept_no = departments.dept_no;

-- 5. List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.

SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

-- 6. List each employee in the Sales department, including their employee number, last name, and first name.

SELECT first_name, last_name, emp_no
FROM employees
WHERE emp_no IN
(
	SELECT emp_no 
	FROM dept_emp
	WHERE dept_no IN
	(
		SELECT dept_no
		FROM departments
		WHERE dept_name = 'Sales'
	)
);

-- 7. List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.

SELECT employees.first_name, employees.last_name, employees.emp_no, departments.dept_name
FROM employees
LEFT JOIN dept_emp ON
employees.emp_no = dept_emp.emp_no
LEFT JOIN departments ON
dept_emp.dept_no = departments.dept_no
WHERE departments.dept_name = 'Sales' OR departments.dept_name = 'Development';

-- 8. List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).

SELECT last_name, COUNT(last_name) AS "Last Name Count"
FROM employees
GROUP BY last_name
ORDER BY last_name DESC;


