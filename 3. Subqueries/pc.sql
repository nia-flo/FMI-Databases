USE pc;

-- 1
SELECT p.maker FROM product AS p
WHERE p.model IN (SELECT pc.model FROM pc
				  WHERE pc.speed > 500);

-- 2
SELECT p.code, p.model, p.price FROM printer AS p
WHERE p.price = (SELECT TOP 1 p2.price FROM printer AS p2
				 ORDER BY p2.price DESC);

-- 3
SELECT * FROM laptop AS l
WHERE l.speed < ALL (SELECT pc.speed FROM pc);

-- 4
(SELECT l.model, l.price FROM laptop AS l
WHERE (l.price >= (SELECT TOP 1 l1.price FROM laptop AS l1
				   ORDER BY l1.price DESC)
	   AND l.price >= (SELECT TOP 1 pc.price FROM pc
					   ORDER BY pc.price DESC)
	   AND l.price >= (SELECT TOP 1 p.price FROM printer AS p
					   ORDER BY p.price DESC)))
UNION
(SELECT pc.model, pc.price FROM pc
WHERE (pc.price >= (SELECT TOP 1 l1.price FROM laptop AS l1
				   ORDER BY l1.price DESC)
	   AND pc.price >= (SELECT TOP 1 pc1.price FROM pc AS pc1
					   ORDER BY pc1.price DESC)
	   AND pc.price >= (SELECT TOP 1 p.price FROM printer AS p
					   ORDER BY p.price DESC)))
UNION
(SELECT p.model, p.price FROM printer AS p
WHERE (p.price >= (SELECT TOP 1 l1.price FROM laptop AS l1
				   ORDER BY l1.price DESC)
	   AND p.price >= (SELECT TOP 1 pc.price FROM pc
					   ORDER BY pc.price DESC)
	   AND p.price >= (SELECT TOP 1 p1.price FROM printer AS p1
					   ORDER BY p1.price DESC)));

-- 5
SELECT TOP 1 pr.maker FROM printer AS p
JOIN product AS pr
ON pr.model = p.model
WHERE p.color = 'y'
ORDER BY p.price ASC;

-- 6
SELECT p.maker FROM pc
JOIN product AS p
ON p.model = pc.model
WHERE (pc.ram = (SELECT TOP 1 pc1.ram FROM pc AS pc1
				 ORDER BY pc1.ram ASC, pc1.speed DESC)
	   AND pc.speed = (SELECT TOP 1 pc1.speed FROM pc AS pc1
					   ORDER BY pc1.ram ASC, pc1.speed DESC));