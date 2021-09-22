USE employees;

-- 2. In your script, use DISTINCT to find the unique titles in the titles table. How many unique titles have there ever been? Answer that in a comment in your SQL file.

SELECT DISTINCT title 
FROM titles;

-- 7 total titles

-- 3. Write a query to to find a list of all unique last names of all employees that start and end with 'E' using GROUP BY.

SELECT last_name, COUNT(last_name)
FROM employees
WHERE last_name LIKE 'e%e'
GROUP BY last_name;

-- 4. Write a query to to find all unique combinations of first and last names of all employees whose last names start and end with 'E'.

SELECT COUNT(last_name), CONCAT(first_name, ' ', last_name) AS full_name
FROM employees
WHERE last_name LIKE 'e%e'
GROUP BY full_name;

-- 5. Write a query to find the unique last names with a 'q' but not 'qu'. Include those names in a comment in your sql code.

SELECT DISTINCT(last_name)
FROM employees
WHERE last_name like '%q%' AND last_name NOT LIKE '%qu%';

-- Names: Chelq, Lindqvist, Qiwen

-- 6. Add a COUNT() to your results (the query above) to find the number of employees with the same last name.

SELECT last_name, COUNT(last_name)
FROM employees
WHERE last_name like '%q%' AND last_name NOT LIKE '%qu%'
GROUP BY last_name;

-- 7 Find all all employees with first names 'Irena', 'Vidya', or 'Maya'. Use COUNT(*) and GROUP BY to find the number of employees for each gender with those names.

SELECT first_name, gender, count(*)
FROM employees
WHERE first_name IN ('Irena', 'Vidya', 'Maya')
GROUP BY first_name, gender;

-- 8. Using your query that generates a username for all of the employees, generate a count employees for each unique username. Are there any duplicate usernames? BONUS: How many duplicate usernames are there?

SELECT LOWER(CONCAT(substr(first_name,1,1), substr(last_name,1,4), '_', substr(birth_date,6,2), substr(birth_date,3,2))) AS user_name, count(*) as totals	
FROM employees
GROUP BY user_name
HAVING totals > 1;

-- 13251 duplicate usernames

-- Find the historic average salary for all employees. Now determine the current average salary.

SELECT AVG(salary)
FROM salaries;

SELECT AVG(salary)
FROM salaries
WHERE now() < to_date;

-- Now find the historic average salary for each employee. Reminder that when you hear "for each" in the problem statement, you'll probably be grouping by that exact column.

SELECT emp_no, AVG(salary)
FROM salaries
GROUP BY emp_no;

-- Find the current average salary for each employee.

SELECT emp_no, AVG(salary)
FROM salaries
WHERE now() < to_date
GROUP BY emp_no;

-- Find the maximum salary for each current employee.

SELECT emp_no, MAX(salary)
FROM salaries
GROUP BY emp_no;

-- Now find the max salary for each current employee where that max salary is greater than $150,000.

SELECT emp_no, MAX(salary)
FROM salaries
GROUP BY emp_no
HAVING MAX(salary) > 150000;

-- Find the current average salary for each employee where that average salary is between $80k and $90k.

SELECT emp_no, AVG(salary)
FROM salaries
GROUP BY emp_no
HAVING AVG(salary) BETWEEN 80000 AND 90000;
