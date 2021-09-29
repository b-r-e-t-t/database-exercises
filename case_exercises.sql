USE employees;

-- 1. Write a query that returns all employees (emp_no), their department number, their start date, their end date, and a new column 'is_current_employee' that is a 1 if the employee is still with the company and 0 if not.

SELECT emp_no, dept_emp.dept_no, hire_date, to_date,
	to_date = '9999-01-01' AS is_current_employee
FROM employees
JOIN dept_emp USING (emp_no)
group by emp_no;

-- 2. Write a query that returns all employee names (previous and current), and a new column 'alpha_group' that returns 'A-H', 'I-Q', or 'R-Z' depending on the first letter of their last name.

SELECT first_name, last_name,
	CASE 
		WHEN last_name < "i" THEN "A-H"
		WHEN last_name < "r" THEN "I-Q"
		ELSE "R-Z"
		END AS alpha_group
FROM employees;

-- 3. How many employees (current or previous) were born in each decade?

SELECT  COUNT(*), 
	CASE
		WHEN birth_date LIKE "194%" THEN "1940s"
		WHEN birth_date LIKE "195%" THEN "1950s"
		WHEN birth_date LIKE "196%" THEN "1960s"
		WHEN birth_date LIKE "197%" THEN "1970s"
		ELSE NULL
		END AS decade_born
FROM employees
GROUP BY decade_born;

select * from departments;

-- Bonus: What is the current average salary for each of the following department groups: R&D, Sales & Marketing, Prod & QM, Finance & HR, Customer Service?

SELECT
       CASE 
           WHEN dept_name IN ('research', 'development') THEN 'R&D'
           WHEN dept_name IN ('sales', 'marketing') THEN 'Sales & Marketing' 
           WHEN dept_name IN ('Production', 'Quality Management') THEN 'Prod & QM'
           ELSE dept_name
           END AS dept_group,
           ROUND(AVG(salaries.salary),2)
FROM departments
JOIN dept_emp USING (dept_no)
JOIN salaries USING (emp_no)
WHERE salaries.to_date LIKE '9999%'
GROUP BY dept_group;
