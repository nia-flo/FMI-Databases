CREATE DATABASE facebook;

USE facebook;

-- 1
CREATE TABLE Users(
	id INT IDENTITY(1,1) PRIMARY KEY,
	email VARCHAR(20) NOT NULL CHECK(email LIKE '%@%.%'),
	password VARCHAR(20) NOT NULL,
	registration_date DATETIME NOT NULL
);

CREATE TABLE Friends(
	friend1Id INT NOT NULL,
	friend2Id INT NOT NULL,
	PRIMARY KEY(friend1Id, friend2Id),
	FOREIGN KEY(friend1Id) REFERENCES Users(id),
	FOREIGN KEY(friend2Id) REFERENCES Users(id)
);

CREATE TABLE Walls(
	id INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	currentUserId INT NOT NULL,
	authorId INT NOT NULL,
	text VARCHAR(1000) NOT NULL,
	date DATETIME NOT NULL,
	FOREIGN KEY(currentUserId) REFERENCES Users(id),
	FOREIGN KEY(authorId) REFERENCES Users(id)
);

CREATE TABLE Groups(
	id INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	name VARCHAR(20) NOT NULL,
	description VARCHAR(50) DEFAULT ''
);

CREATE TABLE GroupMembers(
	groupId INT NOT NULL,
	userId INT NOT NULL,
	PRIMARY KEY(groupId, userId),
	FOREIGN KEY(groupId) REFERENCES Groups(id),
	FOREIGN KEY(userId) REFERENCES Users(id)
);

-- 2
INSERT INTO Users
VALUES ('alex@gmail.com', 'pass123', 01/01/2010),
	   ('maria@abv.bg', 'asdfgh', 12/04/2015),
	   ('ivan@abv.bg', 'vankata1234', 20/09/2007),
	   ('gosho@gmail.com', 'mn silna parola', 13/01/2016),
	   ('peter@gmail.com', 'pe6Opass', 30/11/2019);

INSERT INTO Friends
VALUES (1, 2),
	   (1, 3),
	   (1, 5),
	   (2, 3),
	   (2, 4),
	   (3, 5);

INSERT INTO Walls
VALUES (1, 2, 'Happy birthday!', 09/05/2020),
	   (2, 3, 'We are officially a couple!', 15/03/2021),
	   (4, 2, 'Bro, reply my chats pls..', 01/05/2022);

INSERT INTO Groups
VALUES ('Dog lovers', 'Join us for daily dog pictures'),
	   ('12A class', '12A class of SMG');

INSERT INTO GroupMembers
VALUES (1, 2),
	   (1, 5),
	   (2, 1),
	   (2, 2),
	   (2, 4),
	   (2, 5);