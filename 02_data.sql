-- Little Lemon capstone: sample data
-- Bookings are inserted in 05_bookings.sql, as that exercise asks for it.

USE LittleLemonDB;

INSERT INTO Customers (CustomerID, FullName, ContactNumber, Email) VALUES
  (1, 'Vanessa McCarthy', '0757536378', 'vanessa.mccarthy@example.com'),
  (2, 'Marcos Romero',    '0757536379', 'marcos.romero@example.com'),
  (3, 'Hiroki Yamane',    '0757536376', 'hiroki.yamane@example.com'),
  (4, 'Anna Iversen',     '0757536375', 'anna.iversen@example.com'),
  (5, 'Diana Pinto',      '0757536374', 'diana.pinto@example.com');

INSERT INTO Staff (StaffID, FullName, Role, Salary) VALUES
  (1, 'Mario Gollini',   'Manager',    70000.00),
  (2, 'Adrian Gollini',  'Assistant Manager', 65000.00),
  (3, 'Giorgos Dioudis', 'Head Chef',  50000.00),
  (4, 'Fatma Kaya',      'Assistant Chef', 45000.00),
  (5, 'Elena Salvai',    'Head Waiter', 40000.00),
  (6, 'John Millar',     'Receptionist', 35000.00);

INSERT INTO MenuItems (MenuItemID, ItemName, Category) VALUES
  (1, 'Olives',         'Starter'),
  (2, 'Greek salad',    'Main'),
  (3, 'Pizza',          'Main'),
  (4, 'Cheesecake',     'Dessert'),
  (5, 'Kabasa',         'Main'),
  (6, 'Turkish coffee', 'Drink');

-- A la carte: every menu entry sells one item.
INSERT INTO Menus (MenuID, MenuName, Cuisine, MenuItemID) VALUES
  (1, 'Greek Starter Menu',   'Greek',   1),
  (2, 'Greek Main Menu',      'Greek',   2),
  (3, 'Italian Main Menu',    'Italian', 3),
  (4, 'Italian Dessert Menu', 'Italian', 4),
  (5, 'Turkish Main Menu',    'Turkish', 5),
  (6, 'Turkish Drinks Menu',  'Turkish', 6);

INSERT INTO Orders (OrderID, OrderDate, Quantity, TotalCost, CustomerID, MenuID, StaffID) VALUES
  (1, '2022-10-10', 5, 250.00, 1, 3, 5),
  (2, '2022-10-11', 3, 155.00, 2, 1, 5),
  (3, '2022-10-11', 1,  45.00, 3, 5, 5),
  (4, '2022-10-13', 2,  90.00, 1, 4, 6),
  (5, '2022-11-12', 4, 220.00, 4, 6, 6),
  (6, '2022-11-15', 2, 175.00, 5, 2, 5);

INSERT INTO OrderDeliveryStatus (OrderID, DeliveryDate, Status) VALUES
  (1, '2022-10-10', 'Delivered'),
  (2, '2022-10-11', 'Delivered'),
  (3, '2022-10-12', 'Delivered'),
  (4, '2022-10-13', 'Delivered'),
  (5, '2022-11-12', 'Out for delivery'),
  (6, NULL,         'Preparing');
