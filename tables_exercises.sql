
-- 3. Use the employees database

USE employees;

-- 4. List all the tables in the database

SHOW TABLES;

-- 5. Explore the employees table. What different data types are present on this table?

DESCRIBE employees;

-- 6. Which table(s) do you think contain a numeric type column?

-- emp_no

-- 7. Which table(s) do you think contain a string type column?

-- first_name, last_name

-- 8. Which table(s) do you think contain a date type column?

-- birth_date, hire_date

-- 9. What is the relationship between the employees and the departments tables?

SELECT * 
FROM departments;

-- No shared columns.

-- 10. Show the SQL that created the dept_manager table.

SHOW CREATE TABLE dept_manager;