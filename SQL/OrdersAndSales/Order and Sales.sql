create database project3;

CREATE TABLE Salesman (
SalesmanId INT,
Name VARCHAR(255),
Commission DECIMAL(10, 2),
City VARCHAR(255),
Age INT
);

INSERT INTO Salesman (SalesmanId, Name, Commission, City, Age)
VALUES
(101, 'Joe', 50, 'California', 17),
(102, 'Simon', 75, 'Texas', 25),
(103, 'Jessie', 105, 'Florida', 35),
(104, 'Danny', 100, 'Texas', 22),
(105, 'Lia', 65, 'New Jersey', 30);

CREATE TABLE Customer (
SalesmanId INT,
CustomerId INT,
CustomerName VARCHAR(255),
PurchaseAmount INT,
);

INSERT INTO Customer (SalesmanId, CustomerId, CustomerName, PurchaseAmount)
VALUES
(101, 2345, 'Andrew', 550),
(103, 1575, 'Lucky', 4500),
(104, 2345, 'Andrew', 4000),
(107, 3747, 'Remona', 2700),
(110, 4004, 'Julia', 4545);

CREATE TABLE Orders (OrderId int, CustomerId int, SalesmanId int, Orderdate Date, Amount
money)

INSERT INTO Orders Values
(5001,2345,101,'2021-07-01',550),
(5003,1234,105,'2022-02-15',1500)

select * from Salesman
select * from Customer
select * from Orders

1. Insert a new record into Orders

INSERT INTO Orders
    (OrderId, SalesmanId, CustomerId, OrderDate, PurchaseAmount)
VALUES
    (101, 5, 10, '2026-09-28', 1200);

Adjust the column names and values according to your actual Orders table structure.

2. Customer name ending with N and purchase amount > 500
SELECT * FROM Customer
WHERE CustomerName LIKE '%N'
  AND PurchaseAmount > 500;

3. Using SET operators, retrieve the first result with unique SalesmanId values from two
tables, and the other result containing SalesmanId with duplicates from two tables.

SELECT SalesmanId FROM Salesman
UNION
SELECT SalesmanId FROM Orders;

4. Display order details for purchase amount 500–1500

SELECT O.OrderDate,
       S.SalesmanId,
       C.CustomerId,
       S.Commission,
       S.City
FROM Orders O
JOIN Salesman S
    ON O.SalesmanId = S.SalesmanId
JOIN Customer C
    ON O.CustomerId = C.CustomerId
WHERE O.Amount BETWEEN 500 AND 1500;

5. RIGHT JOIN — all results from Salesman and Orders

SELECT S.*,
       O.*
FROM Orders O
RIGHT JOIN Salesman S
    ON O.SalesmanId = S.SalesmanId;
