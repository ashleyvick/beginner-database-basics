-- ***PERSON***
-- Create a table called person that records a person's id, name, age, height ( in cm ), city, favorite_color. id should be an auto-incrementing id/primary key - Use type: SERIAL

CREATE TABLE person (person_id SERIAL PRIMARY KEY, name VARCHAR (100), age INTEGER, height INTEGER, city VARCHAR (50), favorite_color VARCHAR (200));

-- Add 5 different people into the person database. -- Remember to not include the person_id because it should auto-increment.
INSERT INTO person (name, age, height, city, favorite_color) VALUES ('Harry Potter', 11, 152, 'Surrey', 'Gold');
INSERT INTO person (name, age, height, city, favorite_color) VALUES ('Ron Weasley', 11, 160, 'Devon', 'Green');
INSERT INTO person (name, age, height, city, favorite_color) VALUES ('Hermione Granger', 11, 156, 'London', 'Red');
INSERT INTO person (name, age, height, city, favorite_color) VALUES ('Albus Dumbledore', 150, 274, 'Godrics Hollow', 'Blue');
INSERT INTO person (name, age, height, city, favorite_color) VALUES ('Severus Snape', 45, 189, 'Cokeworth', 'Green');

-- List all the people in the person table by height from tallest to shortest.
SELECT *
FROM person 
ORDER BY height DESC;

-- List all the people in the person table by height from shortest to tallest.
SELECT *
FROM person
ORDER BY height ASC;

-- List all the people in the person table by age from oldest to youngest.
SELECT *
FROM person
ORDER BY age DESC;

-- List all the people in the person table older than age 20.
SELECT *
FROM person
WHERE age > 20;

-- List all the people in the person table that are exactly 18.
SELECT *
FROM person
WHERE age =18;

-- List all the people in the person table that are less than 20 and older than 30.
SELECT *
FROM person
WHERE age < 20 AND age > 30;

-- List all the people in the person table that are not 27 (Use not equals).
SELECT * 
FROM person
WHERE age !=27;

-- List all the people in the person table where their favorite color is not red.
SELECT *
FROM person
WHERE favorite_color !='Red';

-- List all the people in the person table where their favorite color is not red and is not blue.
SELECT *
FROM person
WHERE favorite_color !='Red' AND favorite_color !='Blue';

-- List all the people in the person table where their favorite color is orange or green.
SELECT * 
FROM person 
WHERE favorite_color = 'Orange' OR favorite_color ='Green';

-- List all the people in the person table where their favorite color is orange, green or blue (use IN).
SELECT *
FROM person
WHERE favorite_color IN ('Orange', 'Green', 'Blue');

-- List all the people in the person table where their favorite color is yellow or purple (use IN).
SELECT *
FROM person
WHERE favorite_color IN ('Yellow', 'Purple');

-- ****ORDERS****
-- Create a table called orders that records: order_id, person_id, product_name, product_price, quantity.
CREATE TABLE orders (order_id SERIAL PRIMARY KEY, person_id INTEGER, product_name VARCHAR (150), product_price DECIMAL, quantity INTEGER);

-- Add 5 orders to the orders table.
INSERT INTO orders (person_id, product_name, product_price, quantity) VALUES (0, 'kynetic sand', 10.99, 4);
INSERT INTO orders (person_id, product_name, product_price, quantity) VALUES (1, 'framed picture', 4.89, 10);
INSERT INTO orders (person_id, product_name, product_price, quantity) VALUES (2, 'blue-tooth earbuds', 50, 1);
INSERT INTO orders (person_id, product_name, product_price, quantity) VALUES  (3, 'yo-yo', 2.99, 200)
INSERT INTO orders (person_id, product_name, product_price, quantity) VALUES (4,'smart tv', 300, 4);

-- Select all the records from the orders table.
SELECT *
FROM orders

-- Calculate the total number of products ordered.
SELECT SUM (quantity) 
FROM orders;

-- Calculate the total order price.
SELECT SUM (product_price)
FROM orders;

-- Calculate the total order price by a single person_id.
SELECT SUM (product_price)
FROM orders WHERE person_id = 1

-- ***EMPLOYEE***
-- List all employee first and last names only that live in Calgary.
SELECT first_name, last_name
FROM employee 
WHERE city = 'Calgary'

-- Find the birthdate for the youngest employee.
SELECT MAX (birth_date)
FROM employee

-- Find the birthdate for the oldest employee.
SELECT MIN (birth_date)
FROM employee

-- Find everyone that reports to Nancy Edwards (Use the ReportsTo column).
SELECT *
FROM employee
WHERE reports_to = 2;

-- Count how many people live in Lethbridge.
SELECT COUNT (*)
FROM employee
WHERE city = 'Lethbridge';

-- ***INVOICE***
-- Count how many orders were made from the USA.
SELECT COUNT (*)
FROM invoice
WHERE billing_country = 'USA';

-- Find the largest order total amount.
SELECT MAX (total)
FROM invoice;

-- Find the smallest order total amount.
SELECT MIN (total)
FROM invoice;

-- Find all orders bigger than $5.
SELECT *
FROM invoice
WHERE total > 5;

-- Count how many orders were smaller than $5.
SELECT *
FROM invoice
WHERE total < 5;

-- Count how many orders were in CA, TX, or AZ (use IN).
SELECT *
FROM invoice
WHERE billing_state IN ('CA', 'TX', 'AZ')

-- Get the average total of the orders.
SELECT AVG (total)
FROM invoice;

-- Get the total sum of the orders.
SELECT SUM (total)
FROM invoice;
