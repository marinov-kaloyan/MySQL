#  For problems from 1 to 11 (inclusively) use "soft_uni" database
USE soft_uni;

# 1.Employee Address
SELECT e.employee_id, e.job_title, e.address_id, a.address_text
FROM employees AS e
         INNER JOIN `addresses` AS a ON e.address_id = a.address_id
ORDER BY address_id
LIMIT 5;

# 2.Addresses with Towns
SELECT e.first_name, e.last_name, t.name AS town, a.address_text
FROM employees AS e
         JOIN addresses a on e.address_id = a.address_id
         JOIN towns t on a.town_id = t.town_id
ORDER BY first_name, last_name
LIMIT 5;

# 3.Sales Employee
SELECT e.employee_id, e.first_name, e.last_name, d.name AS `department_name`
FROM employees AS e
         JOIN departments d on e.department_id = d.department_id
WHERE d.name = 'Sales'
ORDER BY employee_id DESC;

# 4.Employee Departments
SELECT e.employee_id, e.first_name, e.salary, d.name AS `department_name`
FROM employees AS e
         JOIN departments d on e.department_id = d.department_id
WHERE e.salary > 15000
ORDER BY d.department_id DESC
LIMIT 5;

# 5. Employees Without Project
SELECT employees.employee_id, employees.first_name
FROM employees
         LEFT JOIN employees_projects ep on employees.employee_id = ep.employee_id
WHERE ep.project_id IS NULL
ORDER BY employee_id DESC
LIMIT 3;

# 6.Employees Hired After
SELECT e.first_name, e.last_name, e.hire_date, d.name AS `dept_name`
FROM employees AS e
         JOIN departments d on e.department_id = d.department_id
WHERE e.hire_date > '1999-01-01 00:00:00'
  AND d.name IN ('Sales', 'Finance')
ORDER BY hire_date;

# 7.Employees with Project
SELECT e.employee_id, e.first_name, p.name AS `project_name`
FROM employees AS e
         JOIN employees_projects ep on e.employee_id = ep.employee_id
         JOIN projects p on ep.project_id = p.project_id
WHERE DATE(p.start_date) > '2002-08-13'
  AND p.end_date IS NULL
ORDER BY first_name, p.name
LIMIT 5;

# 8.Employee 24
SELECT e.employee_id, e.first_name, IF(YEAR(p.start_date) >= 2005, NULL, p.name) AS `project_name`
FROM employees AS e
         JOIN employees_projects ep on e.employee_id = ep.employee_id
         JOIN projects p on ep.project_id = p.project_id
WHERE e.employee_id = 24
ORDER BY project_name;

# 9.Employee Manager
SELECT e.employee_id, e.first_name, e.manager_id, m.first_name AS `manager_name`
FROM employees e,
     employees m
WHERE e.manager_id = m.employee_id
  AND e.manager_id IN (3, 7)
ORDER BY e.first_name;

# 10.Employee Summary
SELECT e.employee_id,
       CONCAT(e.first_name,' ', e.last_name) AS employee_name,
       CONCAT(m.first_name,' ', m.last_name) AS `manager_name`,
       d.name                               AS `department_name`
FROM employees e
         JOIN employees m on e.manager_id = m.employee_id
         JOIN departments d on e.department_id = d.department_id
ORDER BY e.employee_id
LIMIT 5;

# 11.Min Average Salary
SELECT AVG(salary) AS `min_average_salary` FROM employees
GROUP BY department_id
ORDER BY `min_average_salary` LIMIT 1;

# For problems from 12 to 17 (inclusively) use "geography" database.
USE geography;

# 12.Highest Peaks in Bulgaria
SELECT mc.country_code,m.mountain_range,p.peak_name,p.elevation FROM  peaks p
JOIN mountains m on p.mountain_id=m.id
JOIN mountains_countries mc on m.id= mc.mountain_id
WHERE mc.country_code='BG' AND p.elevation>2835
ORDER BY elevation DESC ;

# 13.Count Mountain Ranges
SELECT mc.country_code, COUNT(m.mountain_range) AS `mountain_range` FROM mountains m
JOIN  mountains_countries mc on m.id= mc.mountain_id
WHERE mc.country_code IN ('US','BG', 'RU')
GROUP BY mc.country_code
ORDER BY mountain_range DESC ;

# 14.Countries with Rivers
SELECT  c.country_name,r.river_name FROM countries c
LEFT JOIN countries_rivers cr on c.country_code = cr.country_code
LEFT JOIN rivers r on cr.river_id = r.id
WHERE continent_code='AF'
ORDER BY country_name LIMIT 5;

# 15.*Continents and Currencies
SELECT c.continent_code,c.currency_code, COUNT(*) AS 'currency_usage' FROM countries AS c
GROUP BY c.continent_code , c.currency_code
HAVING currency_usage > 1
   AND currency_usage = (SELECT
                             COUNT(*) AS 'most_used_currency'
                         FROM
                             countries AS c2
                         WHERE
                                 c2.continent_code = c.continent_code
                         GROUP BY c2.currency_code
                         ORDER BY most_used_currency DESC
                         LIMIT 1)
ORDER BY c.continent_code , c.currency_code;

# 16.Countries Without Any Mountains
SELECT COUNT(c.country_code) AS county_count FROM countries c
LEFT JOIN mountains_countries mc on c.country_code = mc.country_code
WHERE mountain_id IS NULL;

# 17.Highest Peak and Longest River by Country
SELECT c.country_name, MAX(p.elevation) AS `highest_peak_elevation`, MAX(r.length) AS `longest_river_length` FROM countries c
JOIN mountains_countries mc on c.country_code = mc.country_code
JOIN peaks p on mc.mountain_id = p.mountain_id
JOIN countries_rivers cr on c.country_code = cr.country_code
JOIN rivers r on r.id = cr.river_id
GROUP BY c.country_code
ORDER BY highest_peak_elevation DESC , longest_river_length DESC LIMIT 5;