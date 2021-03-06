USE movies;

-- 1
SELECT m.TITLE, p.NAME FROM MOVIEEXEC AS p
JOIN MOVIE AS m
ON m.PRODUCERC# = p.CERT#
WHERE p.NAME = (SELECT p1.NAME FROM MOVIEEXEC AS p1
				JOIN MOVIE AS m1
				ON m1.PRODUCERC# = p1.CERT#
				WHERE m1.TITLE = 'Star Wars');

-- 2
SELECT DISTINCT p.NAME FROM STARSIN AS s
JOIN MOVIE AS m
ON m.TITLE = s.MOVIETITLE
JOIN MOVIEEXEC AS p
ON p.CERT# = m.PRODUCERC#
WHERE s.STARNAME = 'Harrison Ford';

-- 3
SELECT DISTINCT s.NAME, si.STARNAME FROM STUDIO AS s
JOIN MOVIE AS m
ON m.STUDIONAME = s.NAME
JOIN STARSIN AS si
ON si.MOVIETITLE = m.TITLE
ORDER BY s.NAME;

-- 4
SELECT si.STARNAME FROM STARSIN AS si
JOIN MOVIE AS m
ON m.TITLE = si.MOVIETITLE
JOIN MOVIEEXEC AS p
ON p.CERT# = m.PRODUCERC#
WHERE p.NETWORTH = (SELECT MAX(p1.NETWORTH) FROM MOVIEEXEC AS p1);

-- 5
SELECT m.NAME FROM MOVIESTAR AS m
WHERE m.NAME NOT IN (SELECT s.STARNAME FROM STARSIN AS s);