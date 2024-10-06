use query;
select * from persons;
-- 1. Find the number of persons in each country.

SELECT 
    Country_name, population
FROM
    persons p
WHERE
    population = (SELECT 
            SUM(population)
        FROM
            persons
        WHERE
            country_name = p.country_name);

-- 2.Find the number of persons in each country sorted from high to low. 
SELECT 
    Country_name, population
FROM
    persons p
WHERE
    population = (SELECT 
            SUM(population)
        FROM
            persons
        WHERE
            country_name = p.country_name
        ORDER BY SUM(population) DESC);

-- 3. Find out an average rating for Persons in respective countries if the average is greater than 3.0
 SELECT 
    Country_name, AVG(Rating)
FROM
    persons
GROUP BY country_name
HAVING AVG(rating) > 3;

-- 4. Find the countries with the same rating as the USA. (Use Subqueries)

SELECT 
    Country_name, Rating
FROM
    persons
WHERE
    rating = (SELECT 
            Rating
        FROM
            persons
        WHERE
            country_name = 'USA');

-- 5. Select all countries whose population is greater than the average population of all nations. 
SELECT 
    country_name, Population
FROM
    persons p
WHERE
    population > (SELECT 
            AVG(population)
        FROM
            persons);


/* Create a database named Product and create a table called Customer with the following fields in the Product database: 
Customer_Id - Make PRIMARY KEY First_name Last_name Email Phone_no Address City State Zip_code 
Country 1. Create a view named customer_info for the Customer table that displays Customer’s Full name and email address. 
Then perform the SELECT operation for the customer_info view. */


create database Product;
use product;
CREATE TABLE Customer (
    Customer_ID INT PRIMARY KEY AUTO_INCREMENT,
    First_name VARCHAR(50),
    Last_name VARCHAR(50),
    Email VARCHAR(50),
    Phone_no BIGINT,
    Adddress VARCHAR(50),
    City VARCHAR(50),
    State VARCHAR(50),
    Zip_code BIGINT,
    Country VARCHAR(50)
);
desc customer;
 insert into Customer ( First_name,Last_name , Email , Phone_no , Adddress , City , State , Zip_code,Country)
 values ('Devi','Nandana','devinandana@gmail.com','7789045621','CDE','chennai','Tamilnadu',554345, 'India'),
 ('Shyam','Mohan','Shyammmohan@gmail.com','6788045621','PQR','Palakkad','Kerala',664345,'India');
insert into Customer values(3,'Ram','Mohan','Rammohan@gmail.com','6789045621','ABC','Ottappalam','Kerala',654345,'India');
insert into Customer values(4,'John','Lewis','johnlewis@gmail.com','1189045621','XYZ','Austin','Austin',112345,'US');
insert into Customer values(5,'Mac','Jogns','macjohns@gmail.com','1180045621','stuv','California','Austin',152345,'US');
insert into Customer values(6,'Augustus','Jogns','augjohns@gmail.com','1100045621','tuv','California','Austin',152345,'US');
insert into Customer values(7,'ben','Jogns','benjohns@gmail.com','1170045621','stv','California','Austin',152345,'US');
insert into Customer values(8,'Rin','Johns','rinjohns@gmail.com','1180046621','uvz','California','Austin',152345,'US');
insert into Customer values(9,'Ram','Kumar','RamKumar@gmail.com','6989045621','rst','Ottappalam','Kerala',657345,'India');
insert into Customer values(10,'Alice','Johns','alijohns@gmail.com','1160046621','uvz','California','Austin',152345,'US');
 select * from customer;

-- Views

 /* 1. Create a view named customer_info for the Customer table that displays Customer’s Full name and email address. 
 Then perform the SELECT operation for the customer_info view. */

CREATE VIEW Customer_info AS
    SELECT 
        First_name, Last_name, Email
    FROM
        customer;
select * from Customer_info;

-- 2. Create a view named US_Customers that displays customers located in the US. 

CREATE VIEW US_CUSTOMERS AS
    SELECT 
        *
    FROM
        CUSTOMER
    WHERE
        COUNTRY = 'US';
SELECT 
    *
FROM
    US_CUSTOMERS;

-- 3. Create another view named Customer_details with columns full name(Combine first_name and last_name), email, phone_no, and state.
CREATE VIEW CUSTOMER_DETAILS AS
    SELECT 
        CONCAT(FIRST_NAME, ' ', LAST_NAME) AS 'FULL NAME',
        EMAIL,
        PHONE_NO,
        STATE
    FROM
        CUSTOMER;
SELECT * FROM CUSTOMER_DETAILS;

-- 4. Update phone numbers of customers who live in California for Customer_details view.
UPDATE customer 
SET 
    phone_no = '1123458904'
WHERE
    city = 'california';

-- 5. Count the number of customers in each state and show only states with more than 5 customers.
SELECT 
    state, COUNT(state) AS customer_count
FROM
    customer
GROUP BY state
HAVING COUNT(state) > 5;

-- 6. Write a query that will return the number of customers in each state, based on the "state" column in the "customer_details" view.

SELECT 
    state, COUNT(state) AS customer_count
FROM
    customer_details
GROUP BY state
HAVING COUNT(state) > 5;

-- 7. Write a query that returns all the columns from the "customer_details" view, sorted by the "state" column in ascending order.
SELECT 
    *
FROM
    customer_details
ORDER BY state;

