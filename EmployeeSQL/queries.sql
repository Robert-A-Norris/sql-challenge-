-- 1. List the following details of each employee: employee number, last name, first name, sex, and salary.
SELECT emp.emp_no, emp.last_name, emp.first_name, emp.sex, sal.salary 
FROM employees as emp
INNER JOIN salaries as sal
ON (emp.emp_no = sal.emp_no);


-- 2. List first name, last name, and hire date for employees who were hired in 1986.
SELECT emp.first_name, emp.last_name, emp.hire_date
FROM employees as emp
WHERE hire_date BETWEEN '1986-01-01' and '1986-12-31';							   
									   


-- 3. List the manager of each department with the following information: department number, department name, 
-- the manager's employee number, last name, first name.

SELECT deptm.dept_no, deps.dept_name, emp.emp_no, emp.last_name, emp.first_name
FROM employees as emp
INNER JOIN dept_manager as deptm
ON (emp.emp_no = deptm.emp_no)
INNER JOIN departments as deps
ON (deps.dept_no = deptm.dept_no);


-- 4. List the department of each employee with the following information: employee number, last name, first name, 
-- and department name.
SELECT emp.emp_no, emp.last_name, emp.first_name, depts.dept_name
FROM employees as emp
INNER JOIN dept_manager as deptm
ON emp.emp_no = deptm.emp_no
INNER JOIN departments as depts
ON deptm.dept_no = depts.dept_no;


-- 5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT first_name, last_name, sex
FROM employees 
WHERE (first_name LIKE 'Hercules' AND last_name LIKE 'B%');


-- 6. List all employees in the Sales department, including their employee number, last name, first name, 
-- and department name.
SELECT depte.emp_no, emp.last_name, emp.first_name, deps.dept_name
FROM dept_emp as depte
JOIN employees as emp
ON depte.emp_no = emp.emp_no
JOIN departments as deps
ON depte.dept_no = deps.dept_no
WHERE deps.dept_name = 'Sales';

-- 7. List all employees in the Sales and Development departments, including their employee number, last name, 
-- first name, and department name.
SELECT depte.emp_no, emp.last_name, emp.first_name, deps.dept_name
FROM dept_emp as depte
JOIN employees as emp 
ON depte.emp_no = emp.emp_no
JOIN departments as deps
ON depte.dept_no = deps.dept_no
WHERE deps.dept_name = 'Sales'
OR deps.dept_name = 'Development';

-- 8. In descending order, list the frequency count of employee last names, i.e., how many employees 
-- share each last name.
SELECT last_name as "Last Name",  COUNT (last_name) as "Frequency"
FROM employees
GROUP BY last_name
ORDER BY COUNT (last_name) DESC;



