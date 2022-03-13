USE pc;

-- 1
SELECT * FROM product AS p
WHERE (p.model NOT IN (SELECT pc.model FROM pc)
	   AND p.model NOT IN (SELECT l.model FROM laptop AS l)
	   AND p.model NOT IN (SELECT pr.model FROM printer AS pr));

-- 2
SELECT DISTINCT p.maker FROM product AS p
WHERE (p.maker IN (SELECT p1.maker FROM product AS p1
		 		   WHERE p1.type = 'Laptop')
	   AND p.maker IN (SELECT p1.maker FROM product AS p1
		 			   WHERE p1.type = 'Printer'));

-- 3
SELECT DISTINCT l.hd FROM laptop AS l
WHERE (SELECT COUNT(DISTINCT(l1.model)) FROM laptop AS l1
	   WHERE l1.hd = l.hd) >= 2;

-- 4
SELECT pc.model FROM pc
LEFT JOIN product AS p
ON p.model = pc.model
WHERE p.maker = NULL;