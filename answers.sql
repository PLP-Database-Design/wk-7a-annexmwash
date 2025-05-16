/* achieving 1NF QUESTION 1*/

-- create database productdb;
-- use productdb;
-- CREATE TABLE ProductDetail (
--     OrderID INT,
--     CustomerName VARCHAR(100),
--     Products VARCHAR(255)
-- );

-- INSERT INTO ProductDetail VALUES
-- (101, 'John Doe', 'Laptop, Mouse'),
-- (102, 'Jane Smith', 'Tablet, Keyboard, Mouse'),
-- (103, 'Emily Clark', 'Phone');

/* transforming into 1NF*/
-- Normalize Products into 1NF
-- SELECT 
--   OrderID,
--   CustomerName,
--   TRIM(jt.product) AS Product
-- FROM ProductDetail,
--   JSON_TABLE(
--     CONCAT('["', REPLACE(Products, ', ', '","'), '"]'),
--     '$[*]' COLUMNS (product VARCHAR(100) PATH '$')
--   ) AS jt;

QUESTION 2
-- CREATE TABLE OrderDetails (
--   OrderID INT,
--   CustomerName VARCHAR(100),
--   Product VARCHAR(100),
--   Quantity INT
-- );

-- INSERT INTO OrderDetails (OrderID, CustomerName, Product, Quantity)
-- VALUES 
-- (101, 'John Doe', 'Laptop', 2),
-- (101, 'John Doe', 'Mouse', 1),
-- (102, 'Jane Smith', 'Tablet', 3),
-- (102, 'Jane Smith', 'Keyboard', 1),
-- (102, 'Jane Smith', 'Mouse', 2),
-- (103, 'Emily Clark', 'Phone', 1);


-- CREATE TABLE MyOrders (
--   OrderID INT PRIMARY KEY,
--   CustomerName VARCHAR(100)
-- );

-- INSERT INTO MyOrders (OrderID, CustomerName)
-- SELECT DISTINCT OrderID, CustomerName
-- FROM OrderDetails;

-- CREATE TABLE MyOrderItems (
--   OrderID INT,
--   Product VARCHAR(100),
--   Quantity INT,
--   PRIMARY KEY (OrderID, Product),
--   FOREIGN KEY (OrderID) REFERENCES MyOrders(OrderID)
-- );

-- INSERT INTO MyOrderItems (OrderID, Product, Quantity)
-- SELECT OrderID, Product, Quantity
-- FROM OrderDetails;



S