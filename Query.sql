Create database Query;
use query;
-- Insert 10 rows into both tables, as given below. Create a table named Country with fields: Id Country_name Population Area
 Create table Country ( ID int primary key auto_increment, Country_name varchar(50), Population Bigint, Area varchar(50));
 
insert into Country Values ( 1, 'USA', 145689500, 'North America');
insert into Country (Country_name, Population, Area)
Values ( 'India', 1005689500, 'Asia'),
( 'Nepal', 15689500, 'Asia'),
( 'Srilanka', 1009500, 'Asia'),
( 'China', 105689500, 'Asia'),
( 'Denmark', 25689500, 'Europe'),
 ( 'Iceland', 5689500, 'Europe'),
 ( 'Poland', 689500, 'Europe'),
 ( 'Egypt', 89500, 'Africa'),
 ( 'Libya', 80500, 'Africa');
 select * from country;
 
 
 -- Create another table named Persons with fields: Id Fname Lname Population Rating Country_Id Country_name
 Create table Persons ( ID int primary key auto_increment, Fname varchar(50),Lname varchar(50), Population Bigint, Rating Decimal(10, 2), Country_ID int, Country_name Varchar(50));
 insert into persons values (1,'RAm','Kumar',2500000,3.75, 9,'Egypt');
 insert into persons (Fname ,Lname , Population , Rating , Country_ID , Country_name )
 values ('Krishna','Kumar', 19800000, 4, 13, 'USA'),
 ('Devi','nandana', 19800000, 4.8, 13, 'USA'),
 ('Sneha','Suresh', 800000, 4.2, 12, 'UK'),
 ('Anjali','K', 1800000, 3.5, 11, 'Canada'),
 ('Divya','Lakshmi', 2800000, 4, 15,'Singapore'),
 ('Deepak','Dev', 1980000000, 4.5, 2, 'India'),
 ('Vinay','Kumar', 1980000, 3.5, 5, 'China'),
 ('Dileep','Kumar', 689500, 4.8, 8, 'Poland'),
 ('Ching','Lee', 105689500, 4, 13, 'USA');
 insert into persons values (11,'Ramesh','Kumar',300000,4.5, 17,'Australia');
 select * from persons;
 
 -- 1. List the distinct country names from the Persons table
 select distinct country_name from persons;
 
 
-- 2. Select first names and last names from the Persons table with aliases
 select Fname as First_name, Lname as Last_name from persons;
 
 -- 3. Find all persons with a rating greater than 4.0
 select * from persons where Rating>4.0;
 select Fname, Lname,Rating from persons where rating>4;
 
-- 4. Find countries with a population greater than 10 lakhs
Select Country_name from country where population>1000000;
 Select Country_name from Persons where population>1000000;
 
 -- 5. Find persons who are from 'USA' or have a rating greater than 4.5. 
 select * from persons where Country_name = 'USA' or Rating >4.5;
 
 -- 6. Find all persons where the country name is NULL.
 Select * from persons where Country_name  IS NUll;
 
 -- 7. Find all persons from the countries 'USA', 'Canada', and 'UK'
 Select Fname as First_name , Lname as Last_name, Country_name as Countries from persons 
 where Country_name = 'USA' or Country_name ='Canada' or Country_name = 'UK';
 
 -- 8 Find all persons not from the countries 'India' and 'Australia'
 select * from persons;
 Select * from persons where Country_name <> 'India'and Country_name <> 'Australia';
 
 -- 9. Find all countries with a population between 5 lakhs and 20 lakhs
 Select * from country where population between 500000 and 2000000;
 Select * from persons where population between 500000 and 2000000;
 
 -- 10 Find all countries whose names do not start with 'C'
  Select * from country where Country_name not like 'C%';
  Select * from country where Country_name like 'C%';
 Select * from persons where Country_name not like 'C%';
 Select * from persons where Country_name like 'C%';
 
 