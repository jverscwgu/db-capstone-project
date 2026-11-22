-- Table bookings, task 3: AddValidBooking, insert inside a transaction and
-- roll back when the table turns out to be taken.
-- The exercise gives the procedure a date and a table only, so the booking
-- is made for customer 1.

USE LittleLemonDB;

DROP PROCEDURE IF EXISTS AddValidBooking;

DELIMITER //
CREATE PROCEDURE AddValidBooking(IN p_BookingDate DATE, IN p_TableNumber INT)
BEGIN
  DECLARE v_Booked INT DEFAULT 0;

  START TRANSACTION;

  SELECT COUNT(*) INTO v_Booked
  FROM Bookings
  WHERE BookingDate = p_BookingDate AND TableNumber = p_TableNumber;

  INSERT INTO Bookings (BookingDate, TableNumber, CustomerID)
  VALUES (p_BookingDate, p_TableNumber, 1);

  IF v_Booked > 0 THEN
    ROLLBACK;
    SELECT CONCAT('Table ', p_TableNumber, ' is already booked - booking cancelled') AS `Booking status`;
  ELSE
    COMMIT;
    SELECT CONCAT('Table ', p_TableNumber, ' booked for ', p_BookingDate) AS `Booking status`;
  END IF;
END //
DELIMITER ;

CALL AddValidBooking('2022-10-10', 5);
