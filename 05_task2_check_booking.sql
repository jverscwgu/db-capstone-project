-- Table bookings, task 2: CheckBooking, is a table already booked on a date?

USE LittleLemonDB;

DROP PROCEDURE IF EXISTS CheckBooking;

DELIMITER //
CREATE PROCEDURE CheckBooking(IN p_BookingDate DATE, IN p_TableNumber INT)
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

CALL CheckBooking('2022-11-12', 3);
