CREATE DATABASE ACADEMICS;
use academics;

-- 1. Create a table named teachers with fields id, name, subject, experience and salary and insert 8 rows. 
CREATE TABLE teacher (
    Id INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(50) NOT NULL,
    Subject VARCHAR(50) NOT NULL,
    Experience INT NOT NULL,
    Salary INT
);

Insert into Teacher (Id,Name,Subject,Experience,Salary)
Values (1,'Ram', 'Electronics', 3, 30000);
Insert into Teacher (Name,Subject,Experience,Salary)
Values ('Dev', 'Electronics', 2, 25000),
('Krishna', 'Maths', 4, 32000),
('Ramya', 'Maths', 2, 30000),
('Devika', 'Physics', 1, 27000),
('Mahesh', 'Physics', 3, 35000),
('Surya', 'Chemistry', 2, 25000),
('Suresh', 'Chemistry', 3, 30000);


/* 2. Create a before insert trigger named before_insert_teacher that will raise an error
 “salary cannot be negative” if the salary inserted to the table is less than zero. */
 
DELIMITER $$
CREATE TRIGGER Before_insert_Teacher
BEFORE INSERT ON TEACHER FOR EACH ROW
BEGIN
    IF new.SALARY<0 THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'salary cannot be negative';
    END IF;
END$$
DELIMITER ;

SELECT * FROM TEACHER;
show triggers;

Insert into Teacher (Id,Name,Subject,Experience,Salary)
Values (9,'Ramesh', 'Electronics', 3, -30000);

/* 3. Create an after insert trigger named after_insert_teacher 
that inserts a row with teacher_id,action, timestamp to a table called teacher_log 
when a new entry gets inserted to the teacher table. tecaher_id -> column of teacher table, 
action -> the trigger action, timestamp -> time at which the new row has got inserted.*/

CREATE TABLE teacher_log (
    Teacher_Id INT PRIMARY KEY AUTO_INCREMENT,
    Actions VARCHAR(10),
    id INT,
    Timestamps TIMESTAMP
);

select * from teacher_log;

DELIMITER $$
CREATE TRIGGER after_insert_teacher
AFTER INSERT ON teacher FOR EACH ROW
BEGIN
    INSERT INTO Teacher_log (Actions,id,timestamps)
    VALUES ('INSERT', NEW.Id , NOW());
END$$
DELIMITER ;

Insert into Teacher (Id,Name,Subject,Experience,Salary)
Values (10,'Rajesh', 'Electronics', 3, 30000);

Insert into Teacher (Id,Name,Subject,Experience,Salary)
Values (11,'Ramesh', 'Graphics', 3, 32000);

Insert into Teacher (Id,Name,Subject,Experience,Salary)
Values (12,'Gautham', 'Electronics', 11, 60000);

select * from teacher_log;

-- 4. Create a before delete trigger that will raise an error when you try to delete a row that has experience greater than 10 years. 

DELIMITER $$
CREATE TRIGGER before_delete_teacher
BEFORE DELETE ON teacher
FOR EACH ROW
BEGIN
    IF OLD.experience > 10 THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Cannot delete employees with greater than 10 years experience';
    END IF;
END$$

delete from teacher where id= 12;


-- 5. Create an after delete trigger that will insert a row to teacher_log table when that row is deleted from teacher table.

delimiter #
create trigger after_delete
after delete on teacher for each row 
begin
	INSERT INTO Teacher_log (Actions,id,timestamps)
    VALUES ('DELETE', OLD.Id , NOW());
    end #
delimiter ;

delete from teacher where id = 3;
delete from teacher where id = 7;

select * from teacher_log;
