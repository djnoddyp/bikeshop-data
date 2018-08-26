DELIMITER //

CREATE PROCEDURE selectAllBikesBelow (p DOUBLE)
  BEGIN
    SELECT * FROM Bike WHERE price < p;
  END;
//

DELIMITER ;