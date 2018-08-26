INSERT INTO Employee (first_name, last_name, bikeshop_id)
  VALUES ('Jim', 'Lahey', (SELECT id FROM Bikeshop WHERE city = 'Belfast'));
INSERT INTO Employee (first_name, last_name, bikeshop_id)
  VALUES ('Randy', 'Lahey', (SELECT id FROM Bikeshop WHERE city = 'Belfast'));
INSERT INTO Employee (first_name, last_name, bikeshop_id)
  VALUES ('Corey', 'Trevor', (SELECT id FROM Bikeshop WHERE city = 'Belfast'));
INSERT INTO Employee (first_name, last_name, bikeshop_id)
  VALUES ('Jacob', 'Collins', (SELECT id FROM Bikeshop WHERE city = 'Belfast'));