CREATE TABLE Bikeshop (
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  address VARCHAR(100) NOT NULL,
  city VARCHAR(30) NOT NULL
);

CREATE TABLE Bike (
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  make VARCHAR(30) NOT NULL,
  model VARCHAR(30) NOT NULL,
  colour ENUM ('red', 'blue', 'green', 'black', 'silver') NOT NULL,
  style ENUM ('mountain', 'road', 'hybrid') NOT NULL,
  price DOUBLE NOT NULL,
  price_dollars DOUBLE,
  bikeshop_id INT NOT NULL,
  CONSTRAINT positive_price CHECK (price > 0),
  CONSTRAINT fk_bike_bikeshop FOREIGN KEY (bikeshop_id) REFERENCES Bikeshop (id)
);

CREATE TABLE Employee (
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  first_name VARCHAR(60) NOT NULL,
  last_name VARCHAR(60) NOT NULL,
  bikeshop_id INT NOT NULL,
  CONSTRAINT fk_employee_bikeshop FOREIGN KEY (bikeshop_id) REFERENCES Bikeshop (id)
);