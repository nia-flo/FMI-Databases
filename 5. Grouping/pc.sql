USE pc;

-- 1
SELECT AVG(speed) AS 'average speed' FROM pc;

-- 2
SELECT p.maker, AVG(l.screen) AS 'average screen' FROM laptop AS l
JOIN product AS p
ON p.model = l.model
GROUP BY p.maker;

-- 3
SELECT AVG(speed) AS 'aversge speed' FROM laptop
WHERE price > 1000;

-- 4
SELECT AVG(pc.price) AS 'average price' FROM pc
JOIN product AS p
ON p.model = pc.model
GROUP BY p.maker
HAVING p.maker = 'A';

-- 5
SELECT (SUM(u.price) / SUM(u.count)) AS 'average price' FROM (
	(SELECT SUM(price) AS price, COUNT(price) AS count FROM pc
	JOIN product AS p
	ON p.model = pc.model
	WHERE p.maker = 'B')
	UNION
	(SELECT SUM(price), COUNT(price) FROM laptop AS l
	JOIN product AS p
	ON p.model = l.model
	WHERE p.maker = 'B')) AS u;

-- 6
SELECT AVG(price) AS 'average price', speed FROM pc
GROUP BY speed;

-- 7
SELECT p.maker, COUNT(pc.code) AS 'PC count' FROM pc
JOIN product AS p
ON p.model = pc.model
GROUP BY p.maker
HAVING COUNT(pc.code) >= 3;

-- 8
SELECT p.maker, pc.price FROM pc
JOIN product AS p
ON p.model = pc.model
WHERE pc.price = (SELECT MAX(pc1.price) FROM pc AS pc1);

-- 9
SELECT speed, AVG(price) AS 'average price' FROM pc
GROUP BY speed
HAVING speed > 800;

-- 10
SELECT p.maker, AVG(pc.hd) AS 'average HD' FROM pc
JOIN product AS p
ON p.model = pc.model
JOIN printer AS pr
ON pr.model IN (SELECT p2.model FROM product AS p2 
				WHERE p2.maker = p.maker)
GROUP BY p.maker;