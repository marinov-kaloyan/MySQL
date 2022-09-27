-- Part I – Queries for SoftUni Database
USE soft_uni;

-- 01. Find Names of All Employees by First Name
SELECT first_name,last_name FROM employees
WHERE  SUBSTRING(first_name,1,2)='Sa';

-- 02. Find Names of All Employees by Last Name
SELECT first_name,last_name FROM employees
WHERE last_name LIKE '%ei%';

-- 03. Find First Names of All Employees
SELECT  first_name FROM employees
WHERE department_id IN (3,10) AND
      extract(hire_date year()) BETWEEN 1995 AND 2005;


-- 04. Find All Employees Except Engineers

-- 05. Find Towns with Name Length

-- 06. Find Towns Starting With

-- 07. Find Towns Not Starting With

-- 08. Create View Employees Hired After

-- 09. Length of Last Name

-- 10. Countries Holding 'A'

-- 11. Mix of Peak and River Names

-- 12. Games From 2011 and 2012 Year

-- 13. User Email Providers

-- 14. Get Users with IP Address Like Pattern

-- 15. Show All Games with Duration

-- 16. Orders Table


