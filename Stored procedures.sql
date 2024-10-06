use query;
Create table worker ( worker_ID int primary key auto_increment, First_name char(25),Last_name char(25), salary int(15), Joining_Date datetime,  Department char(25));
insert into worker values( 1,'Ram','Mohan',100000,'2023-09-12 09:42:29', 'HR');
insert into worker (First_name ,Last_name , salary , Joining_Date ,  Department)
values ('Krishna','Kumar', 800000, '2024-09-17 09:42:29', 'QA'),
 ('Devi','nandana', 600000, '2020-09-17 10:42:29','testing');
 
 select * from worker;
 
/* 1. Create a stored procedure that takes in IN parameters for all the columns in the Worker table and 
adds a new record to the table and then invokes the procedure call.*/

delimiter $$
create procedure add_worker(IN w_worker_ID int, IN wFirst_name char(25), IN wLast_name char(25), IN wsalary int(15), IN wJoining_Date datetime, IN wDepartment char(25))
begin
	insert into worker values (w_worker_ID , wFirst_name , wLast_name, wsalary, wJoining_Date, wDepartment);
end $$
delimiter ;

call add_worker(4,'Divya','Lakshmi',250000,'2024-09-17 10:42:29','Trainee');
call add_worker(5,'Dhanya','Raj',550000,'2024-09-17 10:42:29','Marketing');
 select * from worker;
 
 
 /* 2. Write stored procedure takes in an IN parameter for WORKER_ID and an OUT parameter for SALARY.
 It should retrieve the salary of the worker with the given ID and returns it in the p_salary parameter. 
 Then make the procedure call. */
 
 delimiter $$
create procedure id_based_salary(IN id int, OUT id_salary int )
begin
	select salary from worker where id = worker_id;
end $$
delimiter ;

call id_based_salary(3,@id_salary);


/* 3. Create a stored procedure that takes in IN parameters for WORKER_ID and DEPARTMENT. 
It should update the department of the worker with the given ID. 
Then make a procedure call. */

delimiter $$
create procedure update_worker(IN id int, in Dept char(25))
begin
	update worker set department= dept where id=worker_id ;
end $$
delimiter ;

call update_worker( 4, 'Training');
call update_worker( 3, 'sales');
call update_worker( 2, 'sales');
select * from worker;

/* 4. Write a stored procedure that takes in an IN parameter for DEPARTMENT and an OUT parameter for p_workerCount. 
It should retrieve the number of workers in the given department and returns it in the p_workerCount parameter. 
Make procedure call. */

delimiter $$
create procedure count_Dept(In Dept char(25),out wcount int)
begin
	select count(worker_id) from worker where department=Dept;
end $$
delimiter ;

call count_dept('sales',@worker_id);
call count_dept('marketing',@worker_id);


/* 5. Write a stored procedure that takes in an IN parameter for DEPARTMENT and an OUT parameter for p_avgSalary. 
It should retrieve the average salary of all workers in the given department and returns it in the 
p_avgSalary parameter and call the procedure.*/

delimiter $$
create procedure dept_avgsalary(In Dept char(25),out p_avgSalary int)
begin
	select avg(salary) from worker where department=Dept;
end $$
delimiter ;

call dept_avgsalary('sales',@salary);
call dept_avgsalary('marketing',@salary);

