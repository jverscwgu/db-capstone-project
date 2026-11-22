-- Order procedures, task 3: CancelOrder, delete an order by id

USE LittleLemonDB;

DROP PROCEDURE IF EXISTS CancelOrder;

DELIMITER //
CREATE PROCEDURE CancelOrder(IN p_OrderID INT)
BEGIN
  DELETE FROM Orders WHERE OrderID = p_OrderID;

  IF ROW_COUNT() = 0 THEN
    SELECT CONCAT('Order ', p_OrderID, ' does not exist') AS Confirmation;
  ELSE
    SELECT CONCAT('Order ', p_OrderID, ' is cancelled') AS Confirmation;
  END IF;
END //
DELIMITER ;

CALL CancelOrder(5);
