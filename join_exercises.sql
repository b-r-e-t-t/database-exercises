USE employees;

-- 2. Use join, left join, and right join to combine results from the users and roles tables as we did in the lesson. Before you run each query, guess the expected number of results.

SELECT CONCAT(employees.first_name, ' ', employees.last_name) AS full_name, departments.dept_name
FROM employees
JOIN dept_emp ON dept_emp.emp_no = employees.emp_no
JOIN departments ON departments.dept_no = dept_emp.dept_no
WHERE dept_emp.to_date LIKE '9999%' AND employees.emp_no = 10001;

SELECT employees.first_name, employees.last_name, salaries.salary
FROM employees
LEFT JOIN salaries USING(emp_no)
WHERE salaries.to_date LIKE '9999%';

SELECT employees.first_name, employees.last_name, titles.title
FROM employees
RIGHT JOIN titles USING(emp_no);

-- 3. Although not explicitly covered in the lesson, aggregate functions like count can be used with join queries. Use count and the appropriate join type to get a list of roles along with the number of users that has the role. Hint: You will also need to use group by in the query. Editors Note: I opted to show the count of people currently in the positions.

SELECT titles.title, count(*)
FROM employees
RIGHT JOIN titles USING(emp_no)
WHERE titles.to_date LIKE '1999%'
GROUP BY titles.title;

-- 2. Using the example in the Associative Table Joins section as a guide, write a query that shows each department along with the name of the current manager for that department.

SELECT departments.dept_name AS 'Department Name', CONCAT(employees.first_name, ' ', employees.last_name) AS 'Department Manager'
FROM departments
JOIN dept_manager USING(dept_no)
JOIN employees USING(emp_no)
WHERE dept_manager.to_date LIKE '9999%';

-- 3. Find the name of all departments currently managed by women.

SELECT departments.dept_name AS 'Department Name', CONCAT(employees.first_name, ' ', employees.last_name) AS 'Manager Name'
FROM departments
JOIN dept_manager USING(dept_no)
JOIN employees USING(emp_no)
WHERE dept_manager.to_date LIKE '9999%'
AND employees.gender = 'F';

-- 4. Find the current titles of employees currently working in the Customer Service department.

SELECT titles.title AS 'Title', count(*)
FROM titles
JOIN employees USING(emp_no)
JOIN dept_emp USING(emp_no)
JOIN departments USING(dept_no)
WHERE departments.dept_name = 'Customer Service'
AND titles.to_date = '9999-01-01'
GROUP BY titles.title;

-- 5. Find the current salary of all current managers.

SELECT departments.dept_name AS 'Department Name', CONCAT(employees.first_name, ' ', employees.last_name) AS 'Name', salaries.salary AS 'Salary'
FROM employees
JOIN dept_manager USING(emp_no)
JOIN departments USING(dept_no)
JOIN salaries ON employees.emp_no = salaries.emp_no
WHERE dept_manager.to_date LIKE '9999%' AND salaries.to_date LIKE '9999%';

-- 6. Find the number of current employees in each department.

SELECT dept_emp.dept_no, departments.dept_name, count(employees.emp_no)
FROM `employees`
JOIN dept_emp USING(emp_no)
JOIN departments USING(dept_no)
WHERE dept_emp.to_date LIKE '9999%'
GROUP BY dept_emp.dept_no;

-- 7. Which department has the highest average salary? Hint: Use current not historic information.

SELECT departments.dept_name, AVG(salaries.salary) AS Average
FROM salaries
JOIN dept_emp USING(emp_no)
JOIN departments USING(dept_no)
WHERE salaries.to_date = '9999-01-01'
GROUP BY departments.dept_name
ORDER BY Average DESC
LIMIT 1;



-- 8. Who is the highest paid employee in the Marketing department?

SELECT departments.dept_name AS 'Department Name', CONCAT(employees.first_name, ' ', employees.last_name) AS 'Name', salaries.salary AS 'Salary'
FROM employees
JOIN dept_emp USING(emp_no)
JOIN departments USING(dept_no)
JOIN salaries ON employees.emp_no = salaries.emp_no
WHERE departments.dept_name LIKE 'Marketing' AND salaries.to_date LIKE '9999%'
ORDER BY salaries.salary DESC
LIMIT 1;

-- 9. Which current department manager has the highest salary?

SELECT departments.dept_name AS 'Department Name', CONCAT(employees.first_name, ' ', employees.last_name) AS 'Name', salaries.salary AS 'Salary'
FROM employees
JOIN `dept_manager` USING(emp_no)
JOIN departments USING(dept_no)
JOIN salaries ON employees.emp_no = salaries.emp_no
WHERE dept_manager.to_date LIKE '9999%' AND salaries.to_date LIKE '9999%'
ORDER BY salaries.salary DESC
LIMIT 1;

-- 10. Bonus Find the names of all current employees, their department name, and their current manager's name. 

SELECT CONCAT(employees.first_name, ' ', employees.last_name) AS 'Name', departments.dept_name AS Department, dept_manager.emp_no AS "Dept Manager"
FROM employees
JOIN dept_emp USING(emp_no)
JOIN departments USING(dept_no)
JOIN dept_manager ON dept_manager.emp_no = employees.emp_no
WHERE dept_manager.to_date = '9999-01-01';

-- Currently only showing one of each vs. all, I'm doing something wrong with the joins.

-- 11. Bonus Who is the highest paid employee within each department.

SELECT MAX(salaries.salary), dept_emp.dept_no, departments.dept_name
FROM employees
JOIN salaries USING(emp_no)
JOIN dept_emp USING(emp_no)
JOIN departments using(dept_no)
GROUP BY dept_emp.dept_no;