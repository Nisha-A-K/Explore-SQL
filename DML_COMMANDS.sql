create database DML_COMMANDS;
use DML_COMMANDS;

-- Create table Managers
CREATE TABLE  MANAGERS 
(Manager_id int primary key,
First_name varchar(30),
Last_name varchar(30),
DOB date,
Age int check (Age between 25 and 40),
Last_update date, 
Gender char,
Department varchar(15),
Salary bigint not null);
desc Managers;

-- 1.Insert Values
insert into Managers values 
(1, 'Ram', 'Mohan', '1985-05-28', 39, '2024-5-12', 'M', 'Advertise', 70000),
(2, 'Dev', 'Dath', '1986-05-20', 38, '2024-5-12', 'M', 'HR', 75000),
(3, 'Priya', 'Raman', '1990-05-28', 34, '2024-5-12', 'F', 'HR', 60000),
(4, 'Aalia', 'Singh', '1990-06-15', 34, '2024-5-12', 'F', 'QA', 72000),
(5, 'Kiran', 'K', '1992-06-18', 32, '2024-5-12', 'M', 'Sales', 22000),
(6, 'Fathima', 'Nasnin', '1985-05-28', 39, '2024-5-12', 'F', 'Testing', 30000),
(7, 'Krishna', 'Raj', '1986-04-22', 39, '2024-5-12', 'M', 'Service', 22000),
(8, 'Harshitha', 'Nayak', '1990-08-28', 34, '2024-5-12', 'F', 'Deployment', 50000),
(9, 'Anjali', 'Krishna', '1988-09-16', 36, '2024-5-12', 'F', 'QA', 40000),
(10, 'Anand', 'V', '1985-05-28', 39, '2024-5-12', 'M', 'Testing', 80000);
Select * from managers;


-- 2. Write a query that retrieves the name and date of birth of the manager with Manager_Id 1.
select First_name, Last_Name, dob from managers where manager_id=1;

-- 3.Write a query to display the annual income of all managers
select salary from Managers;
Select 12*salary from managers;

-- 4.Write a query to display records of all managers except ‘Aaliya’
Select * from managers where First_name != "Aalia";

insert into Managers values 
(11, 'Ram', 'Kumar', '1985-05-28', 39, '2024-5-12', 'M', 'IT', 70000), (12, 'Aiswarya', 'Lakshmi', '1986-08-25', 38, '2024-5-12', 'F', 'IT', 22000);
select * from managers;

-- 5.Write a query to display details of managers whose department is IT and earns more than 25000 per month.
select * from managers where department = 'IT' && salary > 25000;

-- 6.Write a query to display details of managers whose salary is between 10000 and 35000.
select * from managers where salary between 10000 and 35000;
