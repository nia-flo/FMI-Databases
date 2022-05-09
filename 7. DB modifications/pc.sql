USE pc;

-- 1
INSERT INTO pc(code, model, speed, ram, hd, cd, price)
VALUES (12, '1100', 2400, 2048, 500, '52x', 229);

INSERT INTO product(maker, model, type)
VALUES ('C', '1100', 'PC');

-- 2
DELETE FROM pc
WHERE model='1100';

-- 3
DELETE FROM laptop
WHERE model IN (SELECT model FROM product AS p
				WHERE maker NOT IN (SELECT maker FROM product AS p
									WHERE p.model IN (SELECT model FROM printer)));

-- 4
UPDATE product
SET maker='A'
WHERE maker='B';

-- 5
UPDATE pc
SET price=price/2,
	hd=hd+20;

-- 6
UPDATE laptop
SET screen=screen+1
WHERE model IN (SELECT model FROM product
				WHERE maker='B');