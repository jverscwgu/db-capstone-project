-- Booking procedures, task 1: AddBooking, add a new table booking

USE LittleLemonDB;

DROP PROCEDURE IF EXISTS AddBooking;

DELIMITER //
CREATE PROCEDURE AddBooking(
  IN p_BookingID   INT,
  IN p_CustomerID  INT,
  IN p_BookingDate DATE,
  IN p_TableNumber INT
)
BEGIN
  INSERT INTO Bookings (BookingID, BookingDate, TableNumber, CustomerID)
  VALUES (p_BookingID, p_BookingDate, p_TableNumber, p_CustomerID);

  SELECT 'New booking added' AS Confirmation;
END //
DELIMITER ;

CALL AddBooking(9, 3, '2022-12-30', 4);
