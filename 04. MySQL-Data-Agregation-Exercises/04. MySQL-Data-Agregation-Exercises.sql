-- Part I Gringotts DB
USE gringotts;

-- 01. Records’ Count
SELECT Count(id) AS `count` FROM wizzard_deposits;

-- 02. Longest Magic Wand
SELECT MAX(magic_wand_size) AS `longest_magic_wand` FROM wizzard_deposits;

-- 03. Longest Magic Wand per Deposit Groups
SELECT deposit_group, MAX(magic_wand_size) AS `longest_magic_wand` FROM wizzard_deposits
GROUP BY deposit_group ORDER BY longest_magic_wand,deposit_group;

-- 04. Smallest Deposit Group per Magic Wand Size
SELECT deposit_group FROM wizzard_deposits
GROUP BY magic_wand_size LIMIT 1;

-- 05. Deposits Sum

-- 06. Deposits Sum for Ollivander Family

-- 07. Deposits Filter

-- 08. Deposit Charge

-- 09. Age Groups

-- 10. First Letter

-- 11. Average Interest

-- 12. Employees Minimum Salaries

-- 13. Employees Average Salaries

-- 14. Employees Maximum Salaries

-- 15. Employees Count Salaries

-- 16. 3rd Highest Salary

-- 17. Salary Challenge

-- 18. Departments Total Salaries
