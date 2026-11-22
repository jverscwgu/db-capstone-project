-- Booking procedures: ManageBooking, report whether a table is free on a date

USE LittleLemonDB;

DROP PROCEDURE IF EXISTS ManageBooking;

DELIMITER //
CREATE PROCEDURE ManageBooking(IN p_BookingDate DATE, IN p_TableNumber INT)
BEGIN
  DECLARE v_Booked INT DEFAULT 0;

  SELECT COUNT(*) INTO v_Booked
  FROM Bookings
  WHERE BookingDate = p_BookingDate AND TableNumber = p_TableNumber;

  IF v_Booked > 0 THEN
    SELECT CONCAT('Table ', p_TableNumber, ' is already booked') AS `Booking status`;
  ELSE
    SELECT CONCAT('Table ', p_TableNumber, ' is available') AS `Booking status`;
  END IF;
END //
DELIMITER ;

CALL ManageBooking('2022-10-10', 5);
