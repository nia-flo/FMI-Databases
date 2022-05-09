CREATE DATABASE problem1;

USE problem1;

-- 1
CREATE TABLE Product(
	maker CHAR(1),
	model CHAR(4),
	type VARCHAR(7),
	PRIMARY KEY(model)
);

CREATE TABLE Printer (
	code INT, 
	model CHAR(4),
	price DECIMAL(7, 2),
	PRIMARY KEY(model)
);

-- 2
INSERT INTO Product(maker, model, type)
VALUES ('A', '1000', 'pc'),
	   ('A', '2000', 'laptop'),
	   ('B', '1123', 'printer'),
	   ('C', '5678', 'printer');

INSERT INTO Printer (code, model, price)
VALUES (1, '1123', 1300),
	   (2, '5678', 500),
	   (1, '9090', 999.99);

-- 3
ALTER TABLE Printer
ADD type VARCHAR(6) CHECK(type IN ('laser', 'matrix', 'jet')),
	color CHAR(1) DEFAULT 'n' CHECK(color IN ('y', 'n'));

-- 4
ALTER TABLE Printer
DROP COLUMN price;

-- 5
DROP TABLE Printer;

DROP TABLE Product;