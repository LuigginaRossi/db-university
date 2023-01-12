-- 1.Contare quanti iscritti ci sono stati ogni anno
SELECT COUNT(id),YEAR(`enrolment_date`)
FROM `students`
WHERE YEAR(`enrolment_date`) = 2021
GROUP BY YEAR(`enrolment_date`);

-- 2. Contare gli insegnanti che hanno l'ufficio nello stesso edificio
SELECT COUNT(*),`office_address`
FROM `teachers`
WHERE  `office_address` LIKE "Borgo %"
GROUP BY `office_address`;

-- 3. Calcolare la media dei voti di ogni appello d'esame
SELECT AVG(`vote`)
FROM `exam_student`
INNER JOIN `exams`
	ON `exam_student`.`exam_id`= `exams`.`id`
GROUP BY `date`;

-- 4. Contare quanti corsi di laurea ci sono per ogni dipartimento
SELECT COUNT(*) AS `number_of_courses`,
	`departments`.`name` AS `name_of_department`
FROM `departments`
INNER JOIN `degrees`
	ON `departments`.`id` = `degrees`.`department_id`
GROUP BY `departments`.`name`;