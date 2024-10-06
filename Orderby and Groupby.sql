create database Query;
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
 insert into Country Values ( 11, 'Kenya', 3000, 'North America');
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
 insert into persons values (18,'Rajesh','Kumar',3000,4.5, 17,'Kenya');
 select * from persons;
 
 -- 1. Write an SQL query to print the first three characters of Country_name from the Country table.
 select substring(Country_name,1,3) from Country;
 
 -- 2. Write an SQL query to concatenate first name and last name from Persons table.
 select concat(Fname,Lname) as names from persons;
 
 -- 3. Write an SQL query to count the number of unique country names from Persons table
 Select Country_name, count(*) as Unique_Country_names From persons Group by Country_name;
 
 -- 4.Write a query to print the maximum population from the Country table.
 Select Country_name, max(population) as Maximum_Population from Country Group by Country_name;
 select max(population) as Maximum_Population from Country;
 
 -- 5. Write a query to print the minimum population from Persons table
 Select Country_name, min(population) as Minimum_Population from Persons Group by Country_name;
 select min(population) as Minimum_Population from persons;
 
 -- 6. Insert 2 new rows to the Persons table making the Lname NULL Then write another query to count Lname from Persons table.
 insert into persons (Fname ,Lname , Population , Rating , Country_ID , Country_name ) values ('Ramesh', Null,300000,4.5, 17,'Australia');
 insert into persons (Fname ,Lname , Population , Rating , Country_ID , Country_name ) values ('Radhika',Null,300000,4.5, 17,'UK');
 select * from persons;
 select count(*) Lname from persons;
 
 -- 7. Write a query to find the number of rows in the Persons table
 Select count(*) from persons;
 
 -- 8. Write an SQL query to show the population of the Country table for the first 3 rows. (Hint: Use LIMIT) 
 Select Country_name, population from Country LIMIT 3;
 
 -- 9. Write a query to print 3 random rows of countries. (Hint: Use rand() function and LIMIT)
 Select * from country order by rand() LIMIT 3;
 
 -- 10.List all persons ordered by their rating in descending order. 
 Select * from persons order by rating desc;
 
 -- 11. Find the total population for each country in the Persons table
 Select Country_name, sum(population) as Total_population  from country group by Country_name;
 
 -- 12. Find countries in the Persons table with a total population greater than 50,000
 select * from country;
 Select Country_name, sum(population) as Total_population  from country where Population>50000 group by Country_name;
 Select Country_name, sum(population) as Total_population  from country where Population<50000 group by Country_name; -- check table
 
 /* 13. List the total number of persons and average rating for each country, 
 but only for countries with more than 2 persons, ordered by the average rating in ascending order.*/
 select Country_name, count(*) as 'Total number of persons', avg(rating) as 'Average Rating'  from persons  
 group by Country_name 
 having Count(*)> 2;   
 
 -- by default the order by is ascending, so I haven't used  "order by" separately. 
 
 