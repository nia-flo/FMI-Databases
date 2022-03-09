USE pc;

-- 1
SELECT p.maker, l.speed FROM laptop AS l
JOIN product AS p
ON p.model = l.model
WHERE l.hd >= 9;

-- 2
SELECT l.model, l.price FROM laptop AS l
JOIN product AS p
ON p.model = l.model
WHERE p.maker = 'B'
UNION 
SELECT pr.model, pr.price FROM printer AS pr
JOIN product AS p
ON p.model = pr.model
WHERE p.maker = 'B'
UNION 
SELECT pc.model, pc.price FROM pc
JOIN product AS p
ON p.model = pc.model
WHERE p.maker = 'B';

-- 3
(SELECT p.maker FROM product AS p
JOIN laptop AS l
ON l.model = p.model)
EXCEPT
(SELECT p.maker FROM product AS p
JOIN pc
ON pc.model = p.model);

-- 4
SELECT DISTINCT(pc.hd) FROM pc
WHERE (SELECT COUNT(pc1.model) FROM pc AS pc1
	   WHERE pc1.hd = pc.hd) >= 2;

-- 5
SELECT pc1.model, pc2.model FROM pc AS pc1, pc AS pc2
WHERE (pc1.speed = pc2.speed AND pc1.ram = pc2.ram AND pc1.model < pc2.model);

-- 6
SELECT DISTINCT(p1.maker) FROM pc AS pc1
JOIN product AS p1
ON p1.model = pc1.model
JOIN product AS p2
ON p2.maker = p1.maker
jOIN pc AS pc2
ON pc2.model = p2.model
WHERE (pc1.model != pc2.model AND pc1.speed >= 400 AND pc2.speed >= 400);