--1.Create a table named "Employees" with columns for ID (integer), Name (varchar), and Salary (decimal).
CREATE TABLE Employees(
	ID int ,
	Name Varchar(100),
	Salary Decimal
)

--2.Add a new column named "Department" to the "Employees" table with data type varchar(50).

ALTER TABLE Employees
ADD Department varchar(256)

--3.Remove the "Salary" column from the "Employees" table.

ALTER TABLE Employees
DROP column salary

--4.Rename the "Department" column in the "Employees" table to "DeptName".

 EXEC sp_rename 'Employees.Department','DeptName','column'


 --5.Create a new table called "Projects" with columns for ProjectID (integer) and ProjectName (varchar).
CREATE TABLE Projects (
	ID INT,
	PrijectName VARCHAR(200)
)

--7.Add a unique constraint to the "Name" column in the "Employees" table.
ALTER TABLE Employees
ADD UNIQUE (Name)

--8.Create a table named "Customers" with columns for CustomerID (integer), FirstName (varchar), LastName (varchar), and Email (varchar), and Status (varchar).
CREATE TABLE Customers(
	CustomerID INT,
	FirstName VARCHAR (200),
	LastName varchar (200),
	Email varchar (256),
	Status Varchar(200)
)
--9.Add a unique constraint to the combination of "FirstName" and "LastName" columns in the "Customers" table.
ALTER TABLE Customers
ADD UNIQUE (FirstName,LastName)

--10.Create a table named "Orders" with columns for OrderID (integer), CustomerID (integer), OrderDate (datetime), and TotalAmount (decimal).
CREATE TABLE Orders(
	OrderID INT, 
	CustomerID INT,
	OrderDate datetime,
	TotalAmount decimal

)
--11.Add a check constraint to the "TotalAmount" column in the "Orders" table to ensure that it is greater than zero.
ALTER TABLE Orders
ADD CHECK (TotalAmount>0)

--12.Create a schema named "Sales" and move the "Orders" table into this schema.
CREATE SCHEMA Sales

ALTER SCHEMA SalesS
TRANSFER dbo.Orders
--13.Rename the "Orders" table to "SalesOrders."
EXEC SP_RENAME 'Sales.Orders','SalesOrders'