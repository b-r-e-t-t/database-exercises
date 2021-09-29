use employees;

show create table employees;

-- 1.  Using the example from the lesson, create a temporary table called employees_with_departments that contains first_name, last_name, and dept_name for employees currently with that department. Be absolutely sure to create this table on your own database. If you see "Access denied for user ...", it means that the query was attempting to write a new table to a database that you can only read.

CREATE TEMPORARY TABLE hopper_1555.employees_with_departments AS
SELECT first_name, last_name, dept_name
FROM employees
JOIN dept_emp USING(emp_no)
JOIN departments USING(dept_no)
WHERE to_date LIKE '9999%';

USE hopper_1555;

SELECT DATABASE();

-- 1 a. Add a column named full_name to this table. It should be a VARCHAR whose length is the sum of the lengths of the first name and last name columns

ALTER TABLE employees_with_departments ADD full_name VARCHAR(30);

-- 1 b. Update the table so that full name column contains the correct data

UPDATE employees_with_departments
SET full_name = CONCAT(first_name, ' ', last_name);

SELECT * FROM employees_with_departments;

-- 1 c. Remove the first_name and last_name columns from the table.

ALTER TABLE employees_with_departments DROP COLUMN first_name;

ALTER TABLE employees_with_departments DROP COLUMN last_name;

-- 1 d. What is another way you could have ended up with this same table?

CREATE TEMPORARY TABLE hopper_1555.employees_with_departments AS
SELECT first_name, last_name, CONCAT(first_name, ' ', last_name) as full_name, dept_name
FROM employees
JOIN dept_emp USING(emp_no)
JOIN departments USING(dept_no)
WHERE to_date LIKE '9999%';

-- 2.  Create a temporary table based on the payment table from the sakila database.

-- Write the SQL necessary to transform the amount column such that it is stored as an integer 
-- representing the number of cents of the payment. For example, 1.99 should become 199.

USE sakila;

CREATE TEMPORARY TABLE hopper_1555.sakila_payment AS
SELECT * FROM payment;

USE hopper_1555;

ALTER TABLE sakila_payment ADD amount_cents INT NOT NULL;

UPDATE sakila_payment
SET amount_cents = amount * 100;

-- 3. Find out how the current average pay in each department compares to the overall, 
-- historical average pay. In order to make the comparison easier, you should use the Z-score 
-- for salaries. In terms of salary, what is the best department right now to work for? The worst?

USE employees;

SELECT round(avg(salary)) FROM salaries;

SELECT round(stddev(salary)) FROM salaries;

CREATE TEMPORARY TABLE hopper_1555.cur_dept_avg as 
( 
SELECT dept_name, ROUND(AVG(salary),2) AS dept_avg_sal FROM departments
JOIN dept_emp USING (dept_no)
JOIN salaries USING (emp_no)
WHERE salaries.to_date LIKE '9999%' AND dept_emp.to_date LIKE '9999%'
GROUP BY dept_name
);

USE hopper_1555;

ALTER TABLE cur_dept_avg ADD COLUMN co_avg_sal FLOAT (10,2);
ALTER TABLE cur_dept_avg ADD COLUMN co_std_sal FLOAT (10,2);
ALTER TABLE cur_dept_avg ADD COLUMN z_score FLOAT (10,2);

UPDATE cur_dept_avg
SET co_avg_sal = (SELECT AVG(salary) FROM employees.salaries);

UPDATE cur_dept_avg
SET co_std_sal = (SELECT STDDEV(salary) FROM employees.salaries);

UPDATE cur_dept_avg
SET z_score = ((dept_avg_sal - co_avg_sal) / co_std_sal);

SELECT * FROM hopper_1555.cur_dept_avg;