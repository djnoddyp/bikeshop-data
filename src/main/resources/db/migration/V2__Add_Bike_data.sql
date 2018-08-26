INSERT INTO Bikeshop (address, city) VALUES ('10 Ravenhill Road', 'Belfast');
INSERT INTO Bikeshop (address, city) VALUES ('14 High Street', 'Comber');
INSERT INTO Bikeshop (address, city) VALUES ('162 Main Road', 'Lisburn');

INSERT INTO Bike (make, model, colour, style, price, price_dollars, bikeshop_id)
  VALUES ('Specialized', 'Rockhopper Pro', 'red', 'mountain', 799.99, 0, (SELECT id FROM Bikeshop WHERE city = 'Belfast'));
INSERT INTO Bike (make, model, colour, style, price, price_dollars, bikeshop_id)
  VALUES ('GT', 'Avalanche 1.0', 'silver', 'mountain', 899.99, 0, (SELECT id FROM Bikeshop WHERE city = 'Belfast'));
INSERT INTO Bike (make, model, colour, style, price, price_dollars, bikeshop_id)
  VALUES ('Cannondale', 'Supersix Evo', 'black', 'road', 2499.98, 0, (SELECT id FROM Bikeshop WHERE city = 'Belfast'));
INSERT INTO Bike (make, model, colour, style, price, price_dollars, bikeshop_id)
  VALUES ('Merida', 'Crossway', 'green', 'hybrid', 499.99, 0, (SELECT id FROM Bikeshop WHERE city = 'Belfast'));
