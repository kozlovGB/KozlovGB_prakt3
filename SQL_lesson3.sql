CREATE DATABASE IF NOT EXISTS sem3;

USE sem3;

CREATE TABLE IF NOT EXISTS `staff`
(
	`id` INT  AUTO_INCREMENT PRIMARY KEY,
	`firstname` VARCHAR(45),
    `lastname` VARCHAR(45),
    `post` VARCHAR(45),
    `seniority` INT,
    `salary` INT,
    `age` INT
);

INSERT INTO staff (firstname, lastname, post, seniority, salary, age)
VALUES
	('Вася', 'Петров', 'Начальник', 40, 100000, 60),
	('Петр', 'Власов', 'Начальник', 8, 70000, 30),
	('Катя', 'Катина', 'Инженер', 2, 70000, 25),
	('Саша', 'Сасин', 'Инженер', 12, 50000, 35),
	('Иван', 'Петров', 'Рабочий', 40, 30000, 59),
	('Петр', 'Петров', 'Рабочий', 20, 55000, 60),
	('Сидр', 'Сидоров', 'Рабочий', 10, 20000, 35),
	('Антон', 'Антонов', 'Рабочий', 8, 19000, 28),
	('Юрий', 'Юрков', 'Рабочий', 5, 15000, 25),
	('Максим', 'Петров', 'Рабочий', 2, 11000, 19),
	('Юрий', 'Петров', 'Рабочий', 3, 12000, 24),
	('Людмила', 'Маркина', 'Уборщик', 10, 10000, 49);
    
/* Отсортируйте данные по полю заработная плата (salary) в порядке:
убывания; возрастания */
SELECT salary, id, firstname,lastname
FROM staff
ORDER BY salary;

SELECT salary, id, firstname,lastname
FROM staff 
ORDER BY salary DESC;

-- Выведите 5 максимальных заработных плат (saraly)

SELECT salary, id, firstname,lastname
FROM staff
ORDER BY salary DESC
LIMIT 5;

-- Посчитайте суммарную зарплату (salary) по каждой специальности (роst)

SELECT post, SUM(salary)
FROM staff
GROUP BY  post;

/* Найдите кол-во сотрудников с специальнастью (post) «Рабочий» 
в возрасте от 24 до 49 лет включительно. */

SELECT post, COUNT(*)
FROM staff
WHERE (post = 'Рабочий') & ((age > 24) | (age =24)) & ((age < 49) | (age =49))
GROUP BY  post;

 -- Найдите количество специальностей
SELECT COUNT(DISTINCT post) AS 'количество специальностей'
FROM staff;

/*Выведите специальности, у которых средний возраст сотрудников меньше
30 лет*/

SELECT post, SUM(age),COUNT(*) 
FROM staff
GROUP BY  post
HAVING  SUM(age)/COUNT(*)<30



