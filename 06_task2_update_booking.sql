-- Booking procedures, task 2: UpdateBooking, move a booking to another date

USE LittleLemonDB;

DROP PROCEDURE IF EXISTS UpdateBooking;

DELIMITER //
CREATE PROCEDURE UpdateBooking(IN p_BookingID INT, IN p_BookingDate DATE)
BEGIN
  UPDATE Bookings SET BookingDate = p_BookingDate WHERE BookingID = p_BookingID;

  SELECT CONCAT('Booking ', p_BookingID, ' updated') AS Confirmation;
END //
DELIMITER ;

CALL UpdateBooking(9, '2022-12-17');
