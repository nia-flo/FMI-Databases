USE movies;

-- 1
INSERT INTO MOVIESTAR(NAME, BIRTHDATE)
VALUES ('Nicole Kidman', 20/06/1967);

-- 2
DELETE FROM MOVIEEXEC
WHERE NETWORTH > 30000000;

-- 2
DELETE FROM MOVIESTAR
WHERE ADDRESS IS NULL;