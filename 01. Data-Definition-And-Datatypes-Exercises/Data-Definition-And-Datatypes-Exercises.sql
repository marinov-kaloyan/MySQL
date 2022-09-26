

CREATE DATABASE minions;
USE `minions`;

-- 01. Create Tables
CREATE TABLE `minions`(
                          id INT PRIMARY KEY AUTO_INCREMENT,
                          name VARCHAR(255),
                          age INT
);
CREATE TABLE  `towns`
(
    town_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL
);

-- 02. Alter Minions Table
-- change towns town_id to id
ALTER TABLE `minions`
    ADD COLUMN  `town_id` INT NOT NULL ,
    ADD CONSTRAINT fk_minions_towns -- not compulsory
        FOREIGN KEY (`town_id`)
            REFERENCES `towns`(`id`);

-- 03. Insert Records in Both Tables
INSERT INTO `towns`(`id`,`name`)
VALUES (1,'Sofia'),(2,'Plovdiv'),(3,'Varna');
INSERT INTO `minions`(`id`,`name`,`age`,`town_id`)
VALUES (1,'Kevin',22,1),
       (2,'Bob',15,3),
       (3,'Steward',NULL,2);

-- 04. Truncate Table Minions
TRUNCATE TABLE `minions`;

-- 05. Drop All Tables
DROP TABLE `minions`;
DROP TABLE `towns`;

-- 06. Create Table People
CREATE DATABASE  `people`;
USE `people`;
CREATE TABLE `people`(
                         `id` INT PRIMARY KEY AUTO_INCREMENT,
                         `name` VARCHAR(200) NOT NULL ,
                         `picture` BLOB,
                         `height` DOUBLE,
                         `weight` DOUBLE,
                         `gender` CHAR(1) NOT NULL ,
                         `birthdate` DATE NOT NULL ,
                         `biography` TEXT
);
INSERT INTO `people` (`name`,`gender`,`birthdate`)
VALUES
    ('Boris','m',Date(now())),
    ('Aleksandar','m',Date(now())),
    ('Dancho','m',DATE(now())),
    ('Petar','m',DATE(now())),
    ('Desi','f',DATE(now()));

-- 07. Create Table Users
CREATE TABLE `users`(
                        `id` INT PRIMARY KEY AUTO_INCREMENT,
                        `username` VARCHAR(30) NOT NULL ,
                        `password` VARCHAR(26) NOT NULL ,
                        `profile_picture` BLOB,
                        `last_login_time` TIME,
                        `is_deleted` BOOLEAN
);

INSERT INTO `users`(`username`,`password`)
VALUES
    ('pesho1','1234'),
    ('ivan1','gotinsam'),
    ('test', 'test1'),
    ('test1', 'test123'),
    ('test2', 'test1345');

-- 08. Change Primary Key

ALTER TABLE `users`
    DROP PRIMARY KEY ,-- REMOVES PRIMARY KEY
    ADD PRIMARY KEY pk_users(`id`,`username`);

-- 09. Set Default Value of a Field
ALTER TABLE `users`
    MODIFY COLUMN `last_login_time` DATETIME DEFAULT NOW();

-- 10. Set Unique Field
ALTER TABLE  `users`
    DROP PRIMARY KEY ,
    ADD CONSTRAINT pk_users
        PRIMARY KEY (`id`) ,
    MODIFY COLUMN `username` VARCHAR(30) UNIQUE;

-- 11. Movies Database
CREATE DATABASE  `movies`;
USE `movies`;
CREATE TABLE `directors`(
                            `id` INT PRIMARY KEY  AUTO_INCREMENT,
                            `director_name` VARCHAR(255) NOT NULL ,
                            `notes` TEXT
);
CREATE TABLE `genres`(
                         `id` INT PRIMARY KEY  AUTO_INCREMENT,
                         `genre_name` VARCHAR(255) NOT NULL ,
                         `notes` text
);
CREATE TABLE `categories`(
                             `id` INT PRIMARY KEY AUTO_INCREMENT,
                             `category_name` VARCHAR(255) NOT NULL ,
                             `notes` text
);
CREATE TABLE `movies`(
                         `id` INT PRIMARY KEY AUTO_INCREMENT,
                         `title` VARCHAR(255) NOT NULL,
                         `director_id` INT ,
                         `copyright_year` YEAR,
                         `length` TIME,
                         `genre_id` INT,
                         `category_id` INT,
                         `rating` DOUBLE,
                         `notes` text
);
INSERT INTO `directors`(`director_name`, `notes`)
VALUES
    ('TestName1', 'TestNotes'),
    ('TestName2', 'TestNotes'),
    ('TestName3', 'TestNotes'),
    ('TestName4', 'TestNotes'),
    ('TestName5', 'TestNotes');


INSERT INTO `genres`(`genre_name`, `notes`)
VALUES
    ('TestName1', 'TestNotes'),
    ('TestName2', 'TestNotes'),
    ('TestName3', 'TestNotes'),
    ('TestName4', 'TestNotes'),
    ('TestName5', 'TestNotes');

INSERT INTO `categories`(`category_name`, `notes`)
VALUES
    ('TestName1', 'TestNotes'),
    ('TestName2', 'TestNotes'),
    ('TestName3', 'TestNotes'),
    ('TestName4', 'TestNotes'),
    ('TestName5', 'TestNotes');

INSERT INTO `movies` (`title`)
VALUES
    ('TestMovie1'),
    ('TestMovie2'),
    ('TestMovie3'),
    ('TestMovie4'),
    ('TestMovie5');

-- 12. Car Rental Database
CREATE DATABASE `car_rental`;
USE `car_rental`;
CREATE TABLE `categories`(
                             `id` INT PRIMARY KEY AUTO_INCREMENT,
                             `category` VARCHAR(255) NOT NULL ,
                             `daily_rate` DOUBLE,
                             `weekly_rate` DOUBLE,
                             `monthly_rate` DOUBLE,
                             `weekend_rate` DOUBLE
);
CREATE TABLE `cars`(
                       id INT PRIMARY KEY AUTO_INCREMENT,
                       plate_number VARCHAR(255) NOT NULL ,
                       make VARCHAR(255)  ,
                       model VARCHAR(255)  ,
                       car_year YEAR,
                       category_id INT,
                       doors INT,
                       picture BLOB,
                       car_condition VARCHAR(255),
                       available ENUM('yes','no')

);
CREATE TABLE `employees`(
                            id INT PRIMARY KEY AUTO_INCREMENT,
                            first_name VARCHAR(255) NOT NULL ,
                            last_name VARCHAR(255) NOT NULL ,
                            title VARCHAR(255),
                            notes TEXT
);
CREATE TABLE `customers`(
                            id INT PRIMARY KEY AUTO_INCREMENT,
                            driver_licence_number VARCHAR(255),
                            full_name VARCHAR(255) NOT NULL,
                            address VARCHAR(255),
                            city VARCHAR(255),
                            zip_code INT,
                            notes TEXT
);
CREATE TABLE `rental_orders` (
                                 id INT PRIMARY KEY AUTO_INCREMENT,
                                 employee_id INT,
                                 customer_id INT,
                                 car_id INT,
                                 car_condition VARCHAR(255),
                                 tank_level INT,
                                 kilometrage_start INT,
                                 kilometrage_end INT,
                                 total_kilometrage INT,
                                 start_date DATE,
                                 end_date DATE,
                                 total_days INT,
                                 rate_applied INT,
                                 tax_rate INT,
                                 order_status VARCHAR(255),
                                 notes TEXT);
INSERT INTO `categories` (`category`)
VALUES
    ('TestName1'),
    ('TestName2'),
    ('TestName3');
INSERT INTO `cars` (`plate_number`)
VALUES
    ('TestName1'),
    ('TestName2'),
    ('TestName3');
INSERT INTO `employees` (`first_name`, `last_name`)
VALUES
    ('TestName1', 'TestName1'),
    ('TestName2', 'TestName2'),
    ('TestName3', 'TestName3');
INSERT INTO `customers` (`driver_licence_number`, `full_name`)
VALUES
    ('TestName1', 'TestName1'),
    ('TestName2', 'TestName2'),
    ('TestName3', 'TestName3');
INSERT INTO `rental_orders` (`employee_id`, `customer_id`)
VALUES
    (1, 2),
    (2, 3),
    (3, 1);





-- 13. Basic Insert
CREATE DATABASE `soft_uni`;
USE soft_uni;
CREATE TABLE `towns`(
                        `id` INT PRIMARY KEY  AUTO_INCREMENT,
                        `name` VARCHAR(255) NOT NULL
);
CREATE TABLE  `addresses`(
                             `id` INT PRIMARY KEY  AUTO_INCREMENT,
                             `address_text` VARCHAR(255) NOT NULL ,
                             `town_id` INT  NOT NULL
);
CREATE TABLE `departments`(
                              `id` INT PRIMARY KEY  AUTO_INCREMENT,
                              `name` VARCHAR(255) NOT NULL
);
CREATE TABLE `employees`(
                            `id` INT PRIMARY KEY  AUTO_INCREMENT,
                            `first_name` VARCHAR(255) NOT NULL,
                            `middle_name`VARCHAR(255) NOT NULL,
                            `last_name`VARCHAR(255) NOT NULL,
                            `job_title`VARCHAR(255) NOT NULL,
                            `department_id` INT NOT NULL,
                            `hire_date` DATE,
                            `salary` DECIMAL(10,2),
                            `address_id` INT

);
INSERT INTO  `towns`(`name`)
VALUES
    ('Sofia'),('Plovdiv'),('Varna'),('Burgas');
INSERT INTO `departments`(`name`)
VALUES
    ('Engineering'),('Sales'),('Marketing'),('Software Development'),('Quality Assurance');
INSERT INTO  `employees`(`first_name`,`middle_name`,`last_name`,`job_title`,`department_id`,`hire_date`,`salary`)
VALUES
    ('Ivan', 'Ivanov', 'Ivanov', '.NET Developer', 4, '2013-02-01', 3500.00),
    ('Petar', 'Petrov', 'Petrov', 'Senior Engineer', 1, '2004-03-02', 4000.00),
    ('Maria', 'Petrova', 'Ivanova', 'Intern', 5, '2016-08-28', 525.25),
    ('Georgi', 'Terziev', 'Ivanov', 'CEO', 2, '2007-12-09', 3000.00),
    ('Peter', 'Pan', 'Pan', 'Intern', 3, '2016-08-28', 599.88);

-- 14. Basic Select All Fields
SELECT * FROM `towns`;
SELECT * FROM `departments`;
SELECT * FROM `employees`;

-- 15. Basic Select All Fields and Order Them
SELECT * FROM `towns` ORDER BY `name`;
SELECT * FROM `departments` ORDER BY `name`;
SELECT * FROM soft_uni.`employees` ORDER BY `salary` DESC ;

-- 16. Basic Select Some Fields
SELECT `name` FROM `towns`
ORDER BY `name`;
SELECT `name` FROM `departments`
ORDER BY `name`;
SELECT `first_name`,`last_name`,`job_title`,`salary` FROM `soft_uni`.`employees`
ORDER BY `salary` DESC ;


-- 17. Increase Employees Salary
UPDATE `employees`
SET `salary`=`salary`*1.1;
SELECT `salary` FROM `soft_uni`.`employees`;