# 1. One-To-One Relationship
CREATE DATABASE `people`;
USE people;
CREATE TABLE `passports`
(
    `passport_id`     INT PRIMARY KEY,
    `passport_number` VARCHAR(50) UNIQUE
);
INSERT INTO passports(passport_id, passport_number)
VALUES (101, 'N34FG21B'),
       (102, 'K65LO4R7'),
       (103, 'ZE657QP2');

CREATE TABLE `people`
(
    `person_id`   INT PRIMARY KEY AUTO_INCREMENT,
    `first_name`  VARCHAR(50)   NOT NULL,
    `salary`      DECIMAL(9, 2) NOT NULL,
    `passport_id` INT UNIQUE,
    CONSTRAINT `fk_passport`
        FOREIGN KEY (passport_id)
            REFERENCES passports (passport_id)
);

INSERT INTO people(first_name, salary, passport_id)
VALUES ('Roberto', 43300.00, 102),
       ('Tom', 56100.00, 103),
       ('Yana', 60200.00, 101);

# 2. One-To-Many Relationship

CREATE DATABASE `cars`;
USE cars;

CREATE TABLE manufacturers
(
    manufacturer_id INT PRIMARY KEY AUTO_INCREMENT,
    `name`          VARCHAR(50) NOT NULL UNIQUE,
    established_on  DATE        NOT NULL
);

INSERT INTO manufacturers(name, established_on)
VALUES ('BMW', '1916/03/01'),
       ('Tesla', '2003/01/01'),
       ('Lada', '1966/05/01');

CREATE TABLE `models`
(
    `model_id`        INT PRIMARY KEY,
    `name`            VARCHAR(50) UNIQUE,
    `manufacturer_id` INT,
    CONSTRAINT `fk`
        FOREIGN KEY (manufacturer_id)
            REFERENCES manufacturers (manufacturer_id)
);

INSERT INTO models(model_id, name, manufacturer_id)
VALUES (101, 'X1', 1),
       (102, 'i6', 1),
       (103, 'Model S', 2),
       (104, 'Model X', 2),
       (105, 'Model 3', 2),
       (106, 'Nova', 3);

# 3. Many-To-Many Relationship
CREATE DATABASE `many_to_many`;
USE many_to_many;

CREATE TABLE `students`
(
    `student_id` INT PRIMARY KEY AUTO_INCREMENT,
    `name`       VARCHAR(20)
);

INSERT INTO students(name)
VALUES ('Mila'),
       ('Toni'),
       ('Ron');

CREATE TABLE `exams`
(
    `exam_id` INT PRIMARY KEY,
    `name`    VARCHAR(50) UNIQUE
);

INSERT INTO exams (exam_id, `name`)
VALUES (101, 'Spring MVC'),
       (102, 'Neo4j'),
       (103, 'Oracle 11g');

CREATE TABLE `students_exams`
(
    `student_id` INT,
    `exam_id`    INT,
    CONSTRAINT fk_student
        FOREIGN KEY (student_id)
            REFERENCES students (student_id),
    CONSTRAINT fl_exam
        FOREIGN KEY (exam_id)
            REFERENCES exams (exam_id)
);

INSERT INTO students_exams (student_id, exam_id)
VALUES (1, 101),
       (1, 102),
       (2, 101),
       (3, 103),
       (2, 102),
       (2, 103);

# 4. Self-Referencing

CREATE TABLE `teachers`
(
    `teacher_id` INT AUTO_INCREMENT PRIMARY KEY,
    `name`       VARCHAR(50) NOT NULL,
    `manager_id` INT
);
ALTER TABLE teachers
    AUTO_INCREMENT = 101;

INSERT INTO teachers (`name`, manager_id)
VALUES ('John', NULL),
       ('Maya', 106),
       ('Silvia', 106),
       ('Ted', 105),
       ('Mark', 101),
       ('Greta', 101);

ALTER TABLE teachers
    ADD CONSTRAINT fk
        FOREIGN KEY (`manager_id`)
            REFERENCES `teachers` (`teacher_id`);

# 5. Online Store Database
CREATE DATABASE `store`;
USE store;

CREATE TABLE `items`
(
    `item_id`      INT(11) PRIMARY KEY AUTO_INCREMENT,
    `name`         VARCHAR(50),
    `item_type_id` INT(11)
);

CREATE TABLE `item_types`
(
    `item_type_id` INT(11) PRIMARY KEY AUTO_INCREMENT,
    `name`         VARCHAR(50)
);
CREATE TABLE `customers`
(
    `customer_id` INT(11) PRIMARY KEY AUTO_INCREMENT,
    `name`        VARCHAR(50),
    `birthday`    DATE,
    `city_id`     INT(11)
);
CREATE TABLE `order_items`
(
    `order_id` INT(11),
    `item_id`  INT(11),
    CONSTRAINT pk
        PRIMARY KEY (order_id, item_id)
);
CREATE TABLE `cities`
(
    `city_id` INT(11) PRIMARY KEY AUTO_INCREMENT,
    `name`    VARCHAR(50)
);
CREATE TABLE `orders`
(
    `order_id`    INT(11) PRIMARY KEY AUTO_INCREMENT,
    `customer_id` INT(11)
);

ALTER TABLE items
    ADD CONSTRAINT `fk_item_type`
        FOREIGN KEY (item_type_id)
            REFERENCES item_types (item_type_id);

ALTER TABLE order_items
    ADD CONSTRAINT `fk_item_id`
        FOREIGN KEY (item_id)
            REFERENCES items (item_id);

ALTER TABLE order_items
    ADD CONSTRAINT `fk_order_id`
        FOREIGN KEY (order_id)
            REFERENCES orders (order_id);

ALTER TABLE `customers`
    ADD CONSTRAINT `fk_city_id`
        FOREIGN KEY (city_id)
            REFERENCES cities (city_id);

ALTER TABLE `orders`
    ADD CONSTRAINT `fk_customer_id`
        FOREIGN KEY (customer_id)
            REFERENCES customers (customer_id);


# 6. University Database
CREATE DATABASE `university`;
USE university;

CREATE TABLE `subjects`
(
    `subject_id`   INT(11) PRIMARY KEY AUTO_INCREMENT,
    `subject_name` VARCHAR(50)
);

CREATE TABLE `majors`
(
    `major_id` INT(11) PRIMARY KEY AUTO_INCREMENT,
    `name`     VARCHAR(50)
);

CREATE TABLE `payments`
(
    `payment_id`     INT(11) PRIMARY KEY AUTO_INCREMENT,
    `payment_date`   DATE,
    `payment_amount` DECIMAL(8, 2),
    `student_id`     INT(11)
);

CREATE TABLE `agenda`
(
    `student_id` INT(11),
    `subject_id` INT(11),
    PRIMARY KEY (student_id, subject_id)
);

CREATE TABLE `students`
(
    `student_id`     INT(11) PRIMARY KEY AUTO_INCREMENT,
    `student_number` VARCHAR(12),
    `student_name`   VARCHAR(50),
    `major_id`       INT(11)
);

ALTER TABLE `agenda`
    ADD CONSTRAINT fk_student_id
        FOREIGN KEY (student_id)
            REFERENCES students (student_id);
ALTER TABLE `agenda`
    ADD CONSTRAINT FK_SUBJECT_ID
        FOREIGN KEY (subject_id)
            REFERENCES subjects (subject_id);


ALTER TABLE `students`
    ADD CONSTRAINT `fk_majors_id`
        FOREIGN KEY (major_id)
            REFERENCES majors (major_id);
ALTER TABLE `payments`
    ADD CONSTRAINT `fk_students_id`
        FOREIGN KEY (student_id)
            REFERENCES students (student_id);

# Using geography DB
USE geography;

# 9.Peaks in Rila
SELECT m.`mountain_range`, p.`peak_name`, p.`elevation`
FROM `mountains` AS m
         JOIN `peaks` AS p
              ON p.`mountain_id` = m.`id`
WHERE m.`mountain_range` = 'Rila'
ORDER BY p.`elevation` DESC;


