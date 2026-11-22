-- Order procedures, task 2: GetOrderDetail, a prepared statement that takes a customer id

USE LittleLemonDB;

PREPARE GetOrderDetail FROM
  'SELECT OrderID, Quantity, TotalCost AS Cost FROM Orders WHERE CustomerID = ?';

SET @id = 1;
EXECUTE GetOrderDetail USING @id;
