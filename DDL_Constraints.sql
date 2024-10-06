-- Create a database called “Sales”
create database sales;
use sales;

/* create a new table named “Orders” in the Sales database with columns: (Order_Id, Customer_name, Product_Category, Ordered_item, Contact_No), 
Use constraints: Primary Key Unique Not Null*/
create table orders
(Order_Id int primary key auto_increment,
Customer_Name varchar(50) not null,
Product_category varchar(50) not null,
Ordered_Item varchar(50) not null,
Contact_No bigint unique);
Desc orders;

-- 1. Add a new column named “order_quantity” to the orders table
alter table orders add Order_Quntity int;

Desc orders;

-- 1. Add a new column named “order_quantity” to the orders table
Alter Table Sales_Orders rename column Order_Quntity to Order_Quantity;

-- 2. Rename the orders table to the sales_orders table.
rename table Orders to Sales_Orders;
Desc orders;
Desc Sales_orders;

-- 3. Insert 10 rows into the sales_orders table
Insert into Sales_Orders (Order_Id,Customer_Name,Product_category,Ordered_Item,Contact_No,Order_Quantity)
Values (1,'Ram', 'Electronics', 'Laptop', '99309533462',3);
select * from Sales_Orders;
Insert into Sales_Orders (Customer_Name,Product_category,Ordered_Item,Contact_No,Order_Quantity)
Values ('Kiran', 'Electronics', 'Mobile', '99305533462',1),
('Dev', 'Electronics', 'Laptop', '99409533462',1),
('Gautham', 'Furniture', 'Table', '99409533488',1),
('Lakshmi', 'Furniture', 'Table', '99409683488',2),
('Revathi', 'Electronics', 'TV', '99409533486',1),
('Parvathi', 'Furniture', 'Bed', '99409533788',2),
('Rithika', 'Cleaning', 'Mop', '98409533488',3),
('Deepak', 'Furniture', 'Chair', '79409533488',6),
('Vivek', 'Electronics', 'Mobile', '89409533488',1);
select * from Sales_orders;

-- 4. Retrieve customer_name and Ordered_Item from the sales_orders table.
select customer_name , Ordered_Item from Sales_Orders;

-- 5. Use the update command to change the name of the product for any row
Update Sales_Orders set Product_Category = "Household" where Ordered_Item = "Mop";
select * from Sales_Orders;

-- 6. Delete the sales_orders table from the database.
drop table Sales_Orders;
desc Sales_orders;








