-- Sales reports, task 3: menus for which more than 2 items were ordered, using ANY

USE LittleLemonDB;

SELECT MenuName
FROM Menus
WHERE MenuID = ANY (SELECT MenuID FROM Orders WHERE Quantity > 2);
