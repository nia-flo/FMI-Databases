USE pc;

-- 1
SELECT pc.model, pc.speed AS 'MHZ', pc.ram AS 'GB' FROM pc
WHERE pc.price < 1200;

-- 2
SELECT DISTINCT(pr.maker) FROM printer AS p
JOIN product AS pr
ON pr.model = p.model;

-- 3
SELECT l.model, l.ram, l.screen FROM laptop AS l
WHERE l.price > 1000;

-- 4
SELECT * FROM printer
WHERE color = 'y';

-- 5
SELECT pc.model, pc.speed, pc.hd FROM pc
WHERE ((cd = '12x' OR cd = '16x') AND price < 2000);