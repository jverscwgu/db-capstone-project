-- Booking procedures, task 3: CancelBooking, remove a booking

USE LittleLemonDB;

DROP PROCEDURE IF EXISTS CancelBooking;

DELIMITER //
CREATE PROCEDURE CancelBooking(IN p_BookingID INT)
BEGIN
  DELETE FROM Bookings WHERE BookingID = p_BookingID;

  IF ROW_COUNT() = 0 THEN
    SELECT CONCAT('Booking ', p_BookingID, ' does not exist') AS Confirmation;
  ELSE
    SELECT CONCAT('Booking ', p_BookingID, ' cancelled') AS Confirmation;
  END IF;
END //
DELIMITER ;

CALL CancelBooking(9);
