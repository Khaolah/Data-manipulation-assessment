create database Supermarket;
use Supermarket

create table customers
(cus_id int primary key, FirstName varchar (50), LastName varchar(50), age int, email varchar(50), region varchar(30));

alter table customers
add gender varchar (20);

insert into customers
values(1100, "Tayealabi", "Moses", 35, "tayelabi@gmail.com", "Nigeria", "Male"),
(1101, "John", "Abraham", 45, "abrahamjohn@gmail.com", "India", "Male"),
(1102, "Anushka", "Sharma", 40, "anushka49@gmail.com", "India", "Female"),
(1103, "Hyun", "Bin", 42, "hyunbin@gmail,com", "Korea", "Male"),
(1104, "Peter", "Stone", 35, "cornerstone@yahoo.com", "America", "Male"),
(1105, "Omotara", "Johnson", 28, "omotaraj@gmail.com", "Nigeria", "Female"),
(1106, "Juliet", "Anex", 29, "julietanex@gmail.com", "Nigeria", "Female"),
(1107, "Choi", "Janwook", 36, "janwook353@gmail.com", "Korea", "Male"),
(1108, "Kim", "Woobin", 33, "woobinjinx@gmail.com", "Korea", "Male"),
(1109, "Ana", "Thompson", 55, "anathompson@gmail.com", "America", "Female");

create table orders
(order_id int primary key, product_id int, order_date date, ship_date date, ship_mode varchar(25), sales float, quantity int, profit float);

alter table orders
add cust_id int;

insert into orders
values(11000, 10000, '2010-08-12', '2010-09-01', "Delivery Truck", 285.49, 5, 500.18, 1100),
(11001, 10001, '2010-02-03', '2010-02-22', 'Delivery Truck', 350.05, 7, 800.93, 1108),
(11002, 10002, '2015-10-16', '2015-11-13', 'Express Air', 1200.71, 3, 1000.12, 1105),
(11003, 10003, '2018-10-22', '2018-11-12', 'Water', 819.49, 1, 200.81, 1108),
(11004, 10004, '2007-07-07', '2007-07-29', 'Express Air', 1500.56, 3, 720.43, 1107),
(11005, 10005, '2017-01-05', '2017-01-25', 'Water', 215.98, 2, 100.67, 1106),
(11006, 10006, '2019-06-19', '2019-07-15', 'Water', 394.27, 3, 30.94, 1109),
(11007, 10007, '2022-04-17', '2022-05-05', 'Delivery Truck', 597.25, 4, 101.23, 1101),
(11008, 10008, '2022-09-11', '2022-09-29', 'Express Air', 4593.85, 10, 789.34, 1103),
(11009, 10009, '2021-11-18', '2021-12-02', 'Water', 1023.23, 6, 85.98, 1102);

create table products
(product_id int Primary key auto_increment, product_name varchar(50), product_category varchar(50));

insert into products
values(10000, 'Newell Chalk Holder', 'Office supplies'),
(10001, 'Aluminum Document Frame', 'Furniture'),
(10002, 'Stacking Trays by OIC', 'Furniture'),
(10003, 'Apple iPhone 5S', 'Technology'),
(10004, 'Safco Drafting Table', 'Furniture'),
(10005, 'Nokia Lumia 521 (T-Mobile)', 'Technology'),
(10006, 'Samsung Galaxy Note 3', 'Technology'),
(10007, 'Lumber Crayons', 'Office supplies'),
(10008, 'Logitech Wireless Touch Keyboard K400', 'Technology'),
(10009, 'Staple envelope', 'Office supplies');


SELECT CONCAT(firstName,' ', LastName) AS FullName
from customers

SELECT LCASE(Ship_mode) AS LowercaseShipmode
from orders;

SELECT UCASE(FirstName) AS UppercaseFirstname
from customers;

SELECT product_name, char_length(product_name) AS Lenght_of_Product_name
FROM Products;

SELECT region, REVERSE(region) AS reversed_region
from customers;

select SUM(profit) AS Totalprofit
from orders;

SELECT ROUND(AVG(sales), 2) AS Average_sales
FROM orders;

SELECT FLOOR(profit)
from orders;

select ROUND(POWER(sales, quantity), 4) AS Total_sales
from orders;

SELECT EXTRACT(YEAR FROM order_date) AS OrderYear,
EXTRACT(MONTH FROM order_date) AS OrderMonth,
EXTRACT(DAY FROM order_date) AS OrderDay
FROM orders
WHERE order_id is NOT NULL;

 SELECT date_format((ship_date), '%y %m %d')
 from orders
 
 SELECT order_id, DATE(order_date) AS OrderDate
 FROM orders 
 WHERE order_id IS NOT NULL

use supermarket

START TRANSACTION;

INSERT INTO customers
VALUES(11020, 'Susan', 'Walfred', 30, 'sushannewalfred@gmail.com', 'Canada', 'Female');

INSERT INTO orders
VALUES(12010, 11215, '2023-01-10', '2023-01-23', 'Delivery truck', 123.78, 5, 200.34, 1121);

INSERT INTO products
VALUES(1121, 'Oraimo powerbank', 'Technology');

COMMIT;

               ROLLBACK TRANSACTION
DELIMITER $$
START TRANSACTION;

INSERT INTO orders
VALUES(12010, 11215, '2023-01-10', '2023-01-23', 'Delivery truck', 123.78, 5, 200.34, 1121);

INSERT INTO products
VALUES(1121, 'Oraimo powerbank', 'Technology');

COMMIT TRANSACTION;
PRINT 'Transaction commited.';

END $$
BEGIN 
   PRINT 'An error occured.'
   IF (XACT_STATE()) <> 0
   BEGIN
       PRINT 'Transaction in process.'
       ROLLBACK TRANSACTION;
       PRINT 'Transaction rolled back.'
END
DELIMITER ; 

DELETE FROM orders
    WHERE order_id = 12010;
COMMIT;
 
 LOCK TABLES customers READ,
              orders WRITE;
 
























