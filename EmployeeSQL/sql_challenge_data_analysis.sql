-- List the employee number, last name, first name, sex, and salary of each employee
SELECT e.emp_no,
       e.last_name,
	   e.first_name,
	   e.sex,
	   s.salary
FROM   employees AS e
INNER JOIN salaries AS s
ON e.emp_no = s.emp_no;

-- List the first name, last name, and hire date for the employees who were hired in 1986
SELECT e.first_name,
       e.last_name,
	   e.hire_date
FROM   employees AS e
WHERE  e.hire_date BETWEEN ('01/01/1986') AND ('12/31/1986');

-- List the manager of each department along with their department number, department name, employee number, last name, and first name
SELECT dm.dept_no,
       d.dept_name,
	   dm.emp_no,
	   e.last_name,
	   e.first_name
FROM   dept_manager AS dm
INNER JOIN departments AS d
ON dm.dept_no = d.dept_no
INNER JOIN employees   AS e
ON dm.emp_no = e.emp_no;
	   
-- List the department number for each employee along with that employee’s employee number, last name, first name, and department name
SELECT de.dept_no,
	   de.emp_no,
	   e.last_name,
	   e.first_name,
	   d.dept_name
FROM   dept_emp AS de
INNER JOIN departments AS d
ON de.dept_no = d.dept_no
INNER JOIN employees   AS e
ON de.emp_no = e.emp_no;

-- List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B
SELECT e.first_name,
       e.last_name,
	   e.sex
FROM   employees AS e
WHERE  e.first_name = 'Hercules'
AND    e.last_name LIKE 'B%';

-- List each employee in the Sales department, including their employee number, last name, and first name
SELECT de.emp_no,
       e.last_name,
	   e.first_name,
	   d.dept_name
FROM   dept_emp AS de
INNER JOIN employees AS e
ON de.emp_no = e.emp_no
INNER JOIN departments AS d
ON de.dept_no = d.dept_no
WHERE dept_name IN ('Sales');

-- List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name
SELECT de.emp_no,
       e.last_name,
	   e.first_name,
	   d.dept_name
FROM   dept_emp AS de
INNER JOIN employees AS e
ON de.emp_no = e.emp_no
INNER JOIN departments AS d
ON de.dept_no = d.dept_no
WHERE dept_name IN ('Sales', 'Development');

-- List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name)
SELECT e.last_name,
       COUNT(*) AS frequency
FROM   employees AS e
GROUP BY e.last_name
ORDER BY frequency DESC;
