-- 1.Selezionare tutti gli studenti iscritti al Corso di Laurea in Economia
SELECT `students`.`name`,
	`students`.`surname`,
    `degrees`.`name` AS `degree_name`
FROM `degrees`
INNER JOIN `students`
	ON `degrees`.`id`= `students`.`degree_id`
WHERE `degrees`.`name` LIKE "Corso di Laurea in Economia";


-- 2. Selezionare tutti i Corsi di Laurea Magistrale del Dipartimento di Neuroscienze
SELECT `courses`.`name` AS `course_name`,
		`departments`.`name` AS `department_name`,
        `degrees`.`level`
FROM `departments`
INNER JOIN `degrees`
	ON `departments`.`id`= `degrees`.`department_id`
    INNER JOIN `courses`
    ON `degrees`.`id`= `courses`.`degree_id`
WHERE `departments`.`name`= "Dipartimento di Neuroscienze"
AND `degrees`.`level`= "magistrale";


-- 3. Selezionare tutti i corsi in cui insegna Fulvio Amato (id=44)
SELECT `teachers`.`name` AS `teacher_name`,
	 `teachers`.`surname` AS `teacher_surname`,
	`courses`.`name` AS `course_name`
FROM `teachers`
INNER JOIN `course_teacher`
    ON `teachers`.`id`= `course_teacher`.`teacher_id`
    INNER JOIN `courses`
    	ON `course_teacher`.`course_id`= `courses`.`id`
WHERE `teachers`.`id` = 44;


-- 4. Selezionare tutti gli studenti con i dati relativi al corso di laurea a cui sono iscritti e il
-- relativo dipartimento, in ordine alfabetico per cognome e nome
SELECT `students`.`name` AS `student_name`,
	`students`.`surname` AS `student_surname`,
	`degrees`.`name` AS `degree_name`,
    `departments`.`name` AS `department_name`
FROM `students`
INNER JOIN `degrees`
	ON `students`.`degree_id`= `degrees`.`id`
INNER JOIN `departments`
	ON `degrees`.`department_id`= `departments`.`id`
ORDER BY `students`.`name`, `students`.`surname` ASC;


-- 5. Selezionare tutti i corsi di laurea con i relativi corsi e insegnanti
SELECT `teachers`.`name` AS `teacher_name`,
	 `teachers`.`surname` AS `teacher_surname`,
     `courses`.`name` AS `course_name`,
	 `degrees`.`name` AS `degree_name`
FROM `teachers`
INNER JOIN `course_teacher`
	ON `teachers`.`id`= `course_teacher`.`teacher_id`
INNER JOIN `courses`
	ON `course_teacher`.`course_id`= `courses`.`id`
INNER JOIN `degrees`
	ON `courses`.`degree_id`= `degrees`.`id`;


-- 6. Selezionare tutti i docenti che insegnano nel Dipartimento di Matematica (54)
SELECT DISTINCT `teachers`.`name` AS `teacher_name`,
	 `teachers`.`surname` AS `teacher_surname`,
	 `departments`.`name` AS `department_name`
FROM `teachers`
INNER JOIN `course_teacher`
	ON `teachers`.`id`= `course_teacher`.`teacher_id`
INNER JOIN `courses`
	ON `course_teacher`.`course_id`= `courses`.`id`
INNER JOIN `degrees`
	ON `courses`.`degree_id`= `degrees`.`id`
INNER JOIN `departments`
	ON `degrees`.`department_id`= `departments`.`id`
WHERE `departments`.`name`= "Dipartimento di Matematica";


-- 7. BONUS: Selezionare per ogni studente quanti tentativi d’esame ha sostenuto per
-- superare ciascuno dei suoi esami
SELECT 
    `courses`.`name` AS `course_name`,
	`exam_id`,
    `students`.`name` AS `student_name`,
	`students`.`surname` AS `student_surname`
FROM `students`
INNER JOIN `exam_student`
	ON `students`.`id`= `exam_student`.`student_id`
INNER JOIN `exams`
	ON `exam_student`.`exam_id`= `exams`.`id`
INNER JOIN `courses`
	ON `exams`.`course_id`= `courses`.`id`
