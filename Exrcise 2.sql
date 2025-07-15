-- nomor 1
SELECT Name, ListPrice FROM Production.Product
WHERE ListPrice > 1000;

-- nomor 2 
select * from HumanResources.Employee
where HireDate > '2012-01-01';

-- nomor 3
select top 10 Name, ListPrice from Production.Product order by ListPrice desc;

-- nomor 4
select Name from Production.Product 
where name like 'B%';

-- pegawai paling muda dan paling tua
select top 1 * from HumanResources.Employee
order by BirthDate desc ;

select top 1 * from HumanResources.Employee
order by BirthDate asc ;

--  nomor 5 
SELECT
    TRIM(a.FirstName) + ' ' + 
    ISNULL(NULLIF(a.MiddleName, '' ) + ' ', '') + 
    a.LastName AS CustomerFullName,
    b.OrderDate,
    b.TotalDue
FROM
    Sales.SalesOrderHeader b
JOIN
    Sales.Customer c ON b.CustomerID = c.CustomerID
JOIN
    Person.Person a ON c.PersonID = a.BusinessEntityID

-- nomor 6
 
 SELECT
    a.Name AS ProductName,
    b.Name AS SubcategoryName
FROM
    Production.Product a
JOIN
    Production.ProductSubcategory b ON a.ProductSubcategoryID = b.ProductSubcategoryID
ORDER BY
    a.Name;


-- nomor 7
SELECT
    TRIM(a.FirstName) + ' ' +
    ISNULL(NULLIF(a.MiddleName, '') + ' ', '') +
    a.LastName AS EmployeeFullName,
    b.JobTitle
FROM
    HumanResources.Employee b
JOIN
    Person.Person a ON b.BusinessEntityID = a.BusinessEntityID
ORDER BY
    EmployeeFullName;

-- nomor 8
SELECT
    soh.SalesOrderID,
    soh.OrderDate,
    TRIM(pp.FirstName) + ' ' +
    ISNULL(NULLIF(pp.MiddleName, '') + ' ', '') +
    pp.LastName AS SalespersonFullName
FROM
    Sales.SalesOrderHeader soh
LEFT JOIN
    Sales.SalesPerson sp ON soh.SalesPersonID = sp.BusinessEntityID
LEFT JOIN
    Person.Person pp ON sp.BusinessEntityID = pp.BusinessEntityID
ORDER BY
    soh.OrderDate;

-- SECTION 3

--nomor 9
select count (ProductLine) as Jumlah from Production.Product.

-- nomor 10
SELECT
    ProductSubcategoryID,
    AVG(ListPrice) AS AverageListPrice
FROM
    Production.Product
GROUP BY
    ProductSubcategoryID
ORDER BY
    ProductSubcategoryID;

-- nomor 11 

SELECT
    JobTitle,
    COUNT(*) AS TotalEmployees
FROM
    HumanResources.Employee
GROUP BY
    JobTitle

-- nomor 12 
SELECT
    YEAR(OrderDate) AS OrderYear,
    COUNT(*) AS TotalOrders
FROM
    Sales.SalesOrderHeader
GROUP BY
    YEAR(OrderDate)
ORDER BY
    OrderYear;

-- SECTION 4

-- nomor 13

SELECT
    TRIM(p.FirstName) + ' ' + 
    ISNULL(NULLIF(p.MiddleName, '') + ' ', '') + 
    p.LastName AS CustomerFullName,
    SUM(soh.TotalDue) AS TotalSalesAmount
FROM
    Sales.SalesOrderHeader soh
JOIN
    Sales.Customer c ON soh.CustomerID = c.CustomerID
JOIN
    Person.Person p ON c.PersonID = p.BusinessEntityID
GROUP BY
    p.FirstName,
    p.MiddleName,
    p.LastName;


-- nomor 14

SELECT
    p.FirstName + ' ' + p.LastName AS SalespersonName,
    COUNT(soh.SalesOrderID) AS TotalOrders
FROM
    Sales.SalesPerson sp
LEFT JOIN
    Sales.SalesOrderHeader soh ON sp.BusinessEntityID = soh.SalesPersonID
JOIN
    Person.Person p ON sp.BusinessEntityID = p.BusinessEntityID
GROUP BY
    p.FirstName,
    p.LastName;

-- nomor 15
SELECT
    YEAR(OrderDate) AS OrderYear,
    AVG (TotalDue) as AverageOrderAmount
FROM
    Sales.SalesOrderHeader
GROUP BY
    YEAR(OrderDate)
ORDER BY
    OrderYear;

-- nomor 16

SELECT TOP 5
    p.Name AS ProductName,
    SUM(sod.OrderQty) AS TotalQuantitySold
FROM
    Sales.SalesOrderDetail sod
JOIN
    Production.Product p ON sod.ProductID = p.ProductID
GROUP BY
    p.Name
ORDER BY
    TotalQuantitySold DESC;

-- Nomor 17 
SELECT
    ps.Name AS SubcategoryName,
    COUNT(p.ProductID) AS ProductCount
FROM
    Production.Product p
JOIN
    Production.ProductSubcategory ps ON p.ProductSubcategoryID = ps.ProductSubcategoryID
WHERE
    p.ListPrice > 500
GROUP BY
    ps.Name
ORDER BY
    ProductCount DESC;

-- Nomor 18
SELECT TOP 1
    p.FirstName + ' ' + p.LastName AS SalespersonName,
    COUNT(soh.SalesOrderID) AS TotalOrdersHandled
FROM
    Sales.SalesOrderHeader soh
JOIN
    Sales.SalesPerson sp ON soh.SalesPersonID = sp.BusinessEntityID
JOIN
    Person.Person p ON sp.BusinessEntityID = p.BusinessEntityID
GROUP BY
    p.FirstName,
    p.LastName
ORDER BY
    TotalOrdersHandled DESC;
