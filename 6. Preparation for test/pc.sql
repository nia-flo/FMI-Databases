USE pc;

-- 1
SELECT l.model FROM laptop AS l
WHERE (l.screen = 15 AND EXISTS(SELECT * FROM laptop AS l1
								WHERE (l1.model = l.model AND l1.screen = 11)));

-- 2
SELECT DISTINCT(pc.model) FROM pc
JOIN product AS p
ON p.model = pc.model
WHERE pc.price < (SELECT MIN(l.price) FROM laptop AS l
				  JOIN product AS p1
				  ON p1.model = l.model
				  WHERE p1.maker = p.maker);

-- 3
SELECT pc.model, AVG(pc.price) FROM pc
JOIN product AS p
ON p.model = pc.model
GROUP BY pc.model, p.maker
HAVING AVG(pc.price) < (SELECT MIN(l.price) FROM laptop AS l
						JOIN product AS p1
						ON p1.model = l.model
						WHERE p.maker = p1.maker);

-- 4
SELECT pc.code, p.maker, (SELECT COUNT(DISTINCT pc1.model) FROM pc AS pc1
						  WHERE pc1.price >= pc.price) AS 'number of pc with higher price'
FROM pc
JOIN product AS p
ON p.model = pc.model