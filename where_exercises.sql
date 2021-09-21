USE employees;

-- 2. Find all current or previous employees with first names 'Irena', 'Vidya', or 'Maya' using IN. Enter a comment with the number of records returned.

SELECT first_name, last_name
FROM employees
WHERE first_name IN ('Irena', 'Vidya', 'Maya');

-- 709 records returned.

-- 3. Find all current or previous employees with first names 'Irena', 'Vidya', or 'Maya', as in Q2, but use OR instead of IN. Enter a comment with the number of records returned. Does it match number of rows from Q2?

SELECT first_name, last_name
FROM employees
WHERE first_name = 'Irena' OR first_name = 'Vidya' OR first_name = 'Maya';

-- 709 records returned, matches Q2.

-- 4. Find all current or previous employees with first names 'Irena', 'Vidya', or 'Maya', using OR, and who is male. Enter a comment with the number of records returned.

SELECT first_name, last_name, gender
FROM employees
WHERE (first_name = 'Irena' OR first_name = 'Vidya' OR first_name = 'Maya')
AND gender = 'M';

-- 441 records returned

-- 5. Find all current or previous employees whose last name starts with 'E'. Enter a comment with the number of employees whose last name starts with E.

SELECT first_name, last_name
FROM employees
WHERE last_name LIKE 'e%';

-- 7330 records returned

-- 6. Find all current or previous employees whose last name starts or ends with 'E'. Enter a comment with the number of employees whose last name starts or ends with E. How many employees have a last name that ends with E, but does not start with E?

SELECT first_name, last_name
FROM employees
WHERE last_name LIKE 'e%' OR last_name LIKE '%e';

-- 30723 records returned

SELECT first_name, last_name
FROM employees
WHERE last_name LIKE '%e' AND NOT last_name LIKE 'e%';

-- 23393 records returned

-- 7. Find all current or previous employees employees whose last name starts and ends with 'E'. Enter a comment with the number of employees whose last name starts and ends with E. How many employees' last names end with E, regardless of whether they start with E?

SELECT first_name, last_name
FROM employees
WHERE last_name LIKE 'e%e';

-- 899 records returned

SELECT first_name, last_name
FROM employees
WHERE last_name LIKE '%e';

-- 24292 records returned

-- 8. Find all current or previous employees hired in the 90s. Enter a comment with the number of employees returned.

SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date LIKE '199%';

-- 135214 records returned

-- 9. Find all current or previous employees born on Christmas. Enter a comment with the number of employees returned.

SELECT first_name, last_name, birth_date
FROM employees
WHERE birth_date LIKE '%-12-25';

-- 842 records returned

-- 10. Find all current or previous employees hired in the 90s and born on Christmas. Enter a comment with the number of employees returned.

SELECT first_name, last_name, birth_date, hire_date
FROM employees
WHERE birth_date LIKE '%-12-25' AND hire_date LIKE '199%';

-- 362 rows returned

-- 11. Find all current or previous employees with a 'q' in their last name. Enter a comment with the number of records returned.

SELECT first_name, last_name
FROM employees
WHERE last_name LIKE '%q%';

-- 1873 records returned

-- 12. Find all current or previous employees with a 'q' in their last name but not 'qu'. How many employees are found?

SELECT first_name, last_name
FROM employees
WHERE last_name LIKE '%q%' AND NOT last_name LIKE '%qu%';

-- 547 records returned
