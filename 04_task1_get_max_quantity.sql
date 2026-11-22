-- Order procedures, task 1: GetMaxQuantity, the largest quantity in any order

USE LittleLemonDB;

DROP PROCEDURE IF EXISTS GetMaxQuantity;

DELIMITER //
CREATE PROCEDURE GetMaxQuantity()
BEGIN
  SELECT MAX(Quantity) AS `Max Quantity in Order` FROM Orders;
END //
DELIMITER ;

CALL GetMaxQuantity();
