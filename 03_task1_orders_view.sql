-- Sales reports, task 1: OrdersView, orders with a quantity greater than 2

USE LittleLemonDB;

CREATE OR REPLACE VIEW OrdersView AS
SELECT OrderID, Quantity, TotalCost AS Cost
FROM Orders
WHERE Quantity > 2;

SELECT * FROM OrdersView;
