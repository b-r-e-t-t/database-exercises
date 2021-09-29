USE employees;

-- 1. Find all the current employees with the same hire date as employee 101010 using a sub-query.

SELECT first_name, last_name, hire_date
FROM employees
JOIN dept_emp USING (emp_no)
WHERE hire_date = 
	(
	SELECT hire_date 
	FROM employees
	WHERE emp_no = 101010
	)
AND to_date LIKE '9999%';
	
-- 2. Find all the titles ever held by all current employees with the first name Aamod.

SELECT DISTINCT title
FROM titles
WHERE emp_no IN
	(
	SELECT emp_no
	FROM employees
	WHERE first_name = 'Aamod'
	)
AND to_date LIKE '9999%';
	
-- 3. How many people in the employees table are no longer working for the company? Give the answer in a comment in your code.

SELECT count(emp_no)
FROM employees
WHERE emp_no NOT IN	
	(
	SELECT emp_no 
	FROM salaries
	WHERE to_date LIKE '9999%'
	);
	
-- 59,900 former employees

-- 4. Find all the current department managers that are female. List their names in a comment in your code.

SELECT first_name, last_name, gender
FROM employees
WHERE emp_no IN
	(
	SELECT emp_no
	FROM dept_manager
	WHERE to_date LIKE '9999%')
AND gender = 'F';

-- 5. Find all the employees who currently have a higher salary than the companies overall, historical average salary.

SELECT emp_no, salary
FROM salaries
WHERE salary >
	(
	SELECT AVG(salary)
	FROM salaries
	)
AND to_date LIKE '9999%';

-- 6. How many current salaries are within 1 standard deviation of the current highest salary? (Hint: you can use a built in function to calculate the standard deviation.) What percentage of all salaries is this?

SELECT COUNT(*)
FROM salaries
WHERE SALARY > 
	(
	SELECT max(salary)
	FROM salaries
	WHERE to_date LIKE '9999%'
	) -
	(
	SELECT stddev(salary) 
	FROM salaries
	WHERE to_date LIKE '9999%'
	)
AND to_date LIKE '9999%';
	
-- 78 Salaries

-- B1. Find all the department names that currently have female managers.

SELECT dept_name
FROM departments
WHERE dept_no IN
		(
		SELECT dept_no 
		FROM dept_manager 
		WHERE to_date LIKE '999%'
		 AND emp_no IN 
			(select emp_no from employees where gender = 'F')
		);
		
