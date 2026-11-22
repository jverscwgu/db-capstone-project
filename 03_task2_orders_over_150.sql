-- Sales reports, task 2: customers with orders that cost more than $150

USE LittleLemonDB;

SELECT c.CustomerID,
       c.FullName,
       o.OrderID,
       o.TotalCost AS Cost,
       m.MenuName,
       mi.ItemName,
       mi.Category
FROM Customers c
JOIN Orders o     ON o.CustomerID = c.CustomerID
JOIN Menus m      ON m.MenuID = o.MenuID
JOIN MenuItems mi ON mi.MenuItemID = m.MenuItemID
WHERE o.TotalCost > 150
ORDER BY o.TotalCost ASC;
