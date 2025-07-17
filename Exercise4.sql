
USE AdventureWorks2022
GO

-- STUDY CASE 1 ---

CREATE VIEW vw_ActiveProductCatalog AS
SELECT 
    Name AS ProductName,
    ProductNumber,
    ListPrice,
    SellStartDate
FROM 
    Production.Product
WHERE 
    SellEndDate IS NULL;

SELECT * FROM vw_ActiveProductCatalog;

-- STUDY CASE 2 ---

CREATE VIEW vw_EmployeeDirectory AS
SELECT 
    p.FirstName + ' ' + ISNULL(p.MiddleName + ' ', '') + p.LastName AS FullName,
    ea.EmailAddress,
    e.JobTitle
FROM 
    HumanResources.Employee e
JOIN 
    Person.Person p ON e.BusinessEntityID = p.BusinessEntityID
JOIN 
    Person.EmailAddress ea ON e.BusinessEntityID = ea.BusinessEntityID
WHERE 
    e.CurrentFlag = 1; -- hanya karyawan aktif


SELECT * FROM vw_EmployeeDirectory;


-- STUDY CASE 3 ---
CREATE VIEW vw_EmployeeDirectory AS
SELECT soh.SalesOrderID, soh.OrderDate, p.FirstName + ' ' + ISNULL(p.MiddleName + ' ', '') + p.LastName AS FullName, 
        soh.TotalDue
FROM Sales.SalesOrderHeader soh
JOIN Sales.Customer c ON soh.CustomerID = c.CustomerID
JOIN Person.Person p ON c.PersonID = p.BusinessEntityID;

SELECT * FROM vw_EmployeeDirectory;


-- STUDY CASE 4 ---

CREATE VIEW vw_ProductPricingByCategory AS
SELECT 
    p.Name AS ProductName,
    ps.Name AS SubcategoryName,
    p.ListPrice
FROM 
    Production.Product p
JOIN 
    Production.ProductSubcategory ps ON p.ProductSubcategoryID = ps.ProductSubcategoryID
WHERE 
    p.ListPrice > 0;

SELECT * FROM vw_ProductPricingByCategory;

-- STUDY CASE 5 ---

CREATE VIEW vw_FrequentCustomer AS
SELECT p.FirstName + ' ' + ISNULL(p.MiddleName + ' ', '') + p.LastName AS FullName, 
        COUNT(soh.SalesOrderID) AS TotalNumberOfOrder
FROM Sales.SalesOrderHeader soh
JOIN Sales.Customer c ON soh.CustomerID = c.CustomerID
JOIN Person.Person p ON c.PersonID = p.BusinessEntityID
GROUP BY p.FirstName + ' ' + ISNULL(p.MiddleName + ' ', '') + p.LastName
HAVING COUNT(soh.SalesOrderID) > 3;

SELECT * FROM vw_FrequentCustomer; 

-- STUDY CASE 6 --


CREATE VIEW vw_SalespersonPerformance AS
SELECT p.FirstName + ' ' + ISNULL(p.MiddleName + ' ', '') + p.LastName AS FullName, 
        SUM (soh.TotalDue) AS TotalSalesAmount,
        COUNT(soh.SalesOrderID) AS NumberOfOrdersHandled
FROM Sales.SalesOrderHeader soh
JOIN Sales.SalesPerson S ON soh.SalesPersonID = s.BusinessEntityID
JOIN Person.Person p ON s.BusinessEntityID = p.BusinessEntityID
GROUP BY p.FirstName + ' ' + ISNULL(p.MiddleName + ' ', '') + p.LastName;

SELECT * FROM vw_SalespersonPerformance;
