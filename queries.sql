-- Multi-Table Query Practice

-- Display the ProductName and CategoryName for all products in the database. Shows 77 records.

SELECT Product.ProductName, Category.CategoryName FROM Product, Category WHERE Product.CategoryId = Category.Id;

-- Display the order Id and shipper CompanyName for all orders placed before August 9 2012. Shows 429 records.

SELECT [Order].Id, Shipper.CompanyName FROM [Order], Shipper WHERE OrderDate < "2012-08-09" AND [Order].ShipVia = Shipper.Id;

-- Display the name and quantity of the products ordered in order with Id 10251. Sort by ProductName. Shows 3 records.

SELECT Product.ProductName, OrderDetail.Quantity, OrderDetail.OrderId FROM Product, OrderDetail WHERE OrderDetail.OrderId = 10251 AND OrderDetail.ProductId = Product.Id ORDER BY ProductName;

-- Display the OrderID, Customer's Company Name and the employee's LastName for every order. All columns should be labeled clearly. Displays 16,789 records.

SELECT [Order].Id AS "OrderId", Customer.CompanyName, Employee.LastName AS "EmployeeLastName" FROM [Order], Customer, Employee WHERE [Order].CustomerId = Customer.Id AND Employee.Id = [Order].EmployeeId;