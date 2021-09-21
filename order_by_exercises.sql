USE employees;

-- 2. Find all employees with first names 'Irena', 'Vidya', or 'Maya', and order your results returned by first name. In your comments, answer: What was the first and last name in the first row of the results? What was the first and last name of the last person in the table?

SELECT first_name, last_name
FROM employees
WHERE first_name IN ('Irena', 'Vidya', 'Maya')
ORDER BY first_name ASC;

-- First name returned: Irena Reutenauer, Last name returned: Vidya Simmen

-- 3. Find all employees with first names 'Irena', 'Vidya', or 'Maya', and order your results returned by first name and then last name. In your comments, answer: What was the first and last name in the first row of the results? What was the first and last name of the last person in the table?

SELECT first_name, last_name
FROM employees
WHERE first_name IN ('Irena', 'Vidya', 'Maya')
ORDER BY first_name ASC, last_name ASC;

-- First name returned: Irena Acton, Last name returned: Vidya Zweizig

-- 4. Find all employees with first names 'Irena', 'Vidya', or 'Maya', and order your results returned by last name and then first name. In your comments, answer: What was the first and last name in the first row of the results? What was the first and last name of the last person in the table?

SELECT first_name, last_name
FROM employees
WHERE first_name IN ('Irena', 'Vidya', 'Maya')
ORDER BY last_name ASC, first_name ASC;

-- First name returned: Irena Acton, Last name returned: Maya Zyda

-- 5. Write a query to to find all employees whose last name starts and ends with 'E'. Sort the results by their employee number. Enter a comment with the number of employees returned, the first employee number and their first and last name, and the last employee number with their first and last name.

SELECT first_name, last_name, emp_no
FROM employees
WHERE last_name LIKE 'e%e'
ORDER BY emp_no;

-- 899 records returned, First: Ramzi Erde, 10021 Last: Tadahiro Erde, 499648

-- 6. Write a query to to find all employees whose last name starts and ends with 'E'. Sort the results by their hire date, so that the newest employees are listed first. Enter a comment with the number of employees returned, the name of the newest employee, and the name of the oldest emmployee.

SELECT first_name, last_name, hire_date
FROM employees
WHERE last_name LIKE 'e%e'
ORDER BY hire_date DESC;

-- 899 records returned, Newest: Teiji Eldridge (1999-11-27), Oldest: Sergi Erde (1985-02-02)

-- 7. Find all employees hired in the 90s and born on Christmas. Sort the results so that the oldest employee who was hired last is the first result. Enter a comment with the number of employees returned, the name of the oldest employee who was hired last, and the name of the youngest emmployee who was hired first.

SELECT first_name, last_name, birth_date, hire_date
FROM employees
WHERE hire_date LIKE "199%"
AND birth_date LIKE "%12-25"
ORDER BY birth_date ASC, hire_date DESC;

-- 362 records returned, Oldest latest hire: Khun Bernini (1952-12-25/1999-08-31) Newest youngest: Douadi Pettis (1964-12-25/1990-05-04)
