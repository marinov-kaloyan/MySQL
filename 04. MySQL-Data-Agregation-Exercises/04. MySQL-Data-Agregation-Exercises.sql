-- Part I Gringotts DB
USE gringotts;

-- 01. Records’ Count
SELECT Count(*) AS `count` FROM wizzard_deposits;

-- 02. Longest Magic Wand
SELECT MAX(magic_wand_size) AS `longest_magic_wand` FROM wizzard_deposits;

-- 03. Longest Magic Wand per Deposit Groups
SELECT deposit_group, MAX(magic_wand_size) AS `longest_magic_wand` FROM wizzard_deposits
GROUP BY deposit_group ORDER BY longest_magic_wand,deposit_group;

-- 04. Smallest Deposit Group per Magic Wand Size
SELECT  deposit_group FROM wizzard_deposits
GROUP BY  deposit_group
ORDER BY AVG(magic_wand_size) LIMIT 1;


-- 05. Deposits Sum
SELECT deposit_group, SUM(deposit_amount) AS `total_sum`
FROM wizzard_deposits
GROUP BY deposit_group
ORDER BY total_sum;

-- 06. Deposits Sum for Ollivander Family
SELECT deposit_group, SUM(deposit_amount) AS `total_sum`
FROM wizzard_deposits
WHERE magic_wand_creator='Ollivander family'
GROUP BY deposit_group
ORDER BY deposit_group;

-- 07. Deposits Filter
SELECT deposit_group, SUM(deposit_amount) AS `total_sum`
FROM wizzard_deposits
WHERE magic_wand_creator='Ollivander family'
GROUP BY deposit_group
HAVING total_sum<150000
ORDER BY total_sum DESC ;

-- 08. Deposit Charge
SELECT deposit_group,magic_wand_creator, MIN(deposit_charge) AS `min_deposit_charge`FROM wizzard_deposits
GROUP BY deposit_group, magic_wand_creator
ORDER BY magic_wand_creator,deposit_group;

-- 09. Age Groups
# SELECT age AS `age_group`, count(*) AS `wizard_count` FROM wizzard_deposits
# GROUP BY age BETWEEN  0 AND 10  ,age BETWEEN 11 AND 20, age BETWEEN 21 AND 30,age BETWEEN 31 AND 40
# ,age BETWEEN  41 AND 50, age BETWEEN 51 AND 60, age BETWEEN 61 AND 70
# ORDER BY age_group; # not done

-- 10. First Letter
SELECT  LEFT(first_name,1) AS `first_letter` FROM wizzard_deposits
WHERE deposit_group='Troll Chest'
GROUP BY first_letter
ORDER BY first_letter;
-- 11. Average Interest

-- 12. Employees Minimum Salaries

-- 13. Employees Average Salaries

-- 14. Employees Maximum Salaries

-- 15. Employees Count Salaries

-- 16. 3rd Highest Salary

-- 17. Salary Challenge

-- 18. Departments Total Salaries
