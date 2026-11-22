-- Booking procedures: ManageBooking, book a table if it is free on that date
-- and reject the booking if it is already reserved.
-- Like AddValidBooking, it takes a date and a table number and books for
-- customer 1.

USE LittleLemonDB;

DROP PROCEDURE IF EXISTS ManageBooking;

DELIMITER //
CREATE PROCEDURE ManageBooking(IN p_BookingDate DATE, IN p_TableNumber INT)
BEGIN
  DECLARE v_Booked INT DEFAULT 0;

  START TRANSACTION;

  SELECT COUNT(*) INTO v_Booked
  FROM Bookings
  WHERE BookingDate = p_BookingDate AND TableNumber = p_TableNumber;

  IF v_Booked > 0 THEN
    ROLLBACK;
    SELECT CONCAT('Table ', p_TableNumber, ' is already booked - booking cancelled') AS `Booking status`;
  ELSE
    INSERT INTO Bookings (BookingDate, TableNumber, CustomerID)
    VALUES (p_BookingDate, p_TableNumber, 1);
    COMMIT;
    SELECT CONCAT('Table ', p_TableNumber, ' booked for ', p_BookingDate) AS `Booking status`;
  END IF;
END //
DELIMITER ;

SELECT * FROM Bookings;

-- An available table, then one that is already reserved.
CALL ManageBooking('2022-12-17', 6);
CALL ManageBooking('2022-10-10', 5);
