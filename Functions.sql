use query;
select * from country;
select * from persons;

-- 1. Add a new column called DOB in Persons table with data type as Date.
alter table Persons add DOB date; 
desc persons;

UPDATE persons SET DOB = '1985-05-28' WHERE ID=1;
UPDATE persons SET DOB = '1990-05-28' WHERE ID=2;
UPDATE persons SET DOB = '1993-06-28' WHERE ID=3;
UPDATE persons SET DOB = '1989-07-27' WHERE ID=4;
UPDATE persons SET DOB = '1995-09-2' WHERE ID=5;
UPDATE persons SET DOB = '2000-05-28' WHERE ID=6;
UPDATE persons SET DOB = '1992-11-8' WHERE ID=7;
UPDATE persons SET DOB = '1994-12-17' WHERE ID=8;
UPDATE persons SET DOB = '1995-05-3' WHERE ID=9;
UPDATE persons SET DOB = '2001-05-28' WHERE ID=10;

SELECT * FROM PERSONS;

-- 2. Write a user-defined function to calculate age using DOB.

DELIMITER ##
CREATE FUNCTION AGE( cur date,DOB date)
RETURNS INT
DETERMINISTIC
BEGIN
return datediff(curdate(),DOB)/365;
end##
delimiter ;


-- 3. Write a select query to fetch the Age of all persons using the function that has been created.
SELECT AGE(curdate(),DOB) FROM PERSONS;

-- 4. Find the length of each country name in the Country table.
SELECT COUNTRY_NAME, length(COUNTRY_NAME) FROM PERSONS;

-- 5. Extract the first three characters of each country's name in the Country table
SELECT COUNTRY_NAME, LEFT(COUNTRY_NAME,3) FROM PERSONS;

-- 6. Convert all country names to uppercase and lowercase in the Country table.
SELECT COUNTRY_NAME, LOWER(COUNTRY_NAME) FROM PERSONS;
SELECT COUNTRY_NAME, UPPER(COUNTRY_NAME) FROM PERSONS;