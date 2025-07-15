-- nomor 1
select Name, ListPrice from Production.Product
where ListPrice > 1000;

-- nomor 2 
select * from HumanResources.Employee
where HireDate > '2012-01-01';

-- nomor 3
select top 10 * from Production.Product order by ListPrice desc;

-- nomor 4
select Name from Production.Product 
where name like 'B%';