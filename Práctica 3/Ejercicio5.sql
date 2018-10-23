-- ~ Ejercicio 5: Obtener una lista de todas las combinaciones parte-color/parte-ciudad, eliminando todas las parejas color/ciudad repetidas.
SELECT DISTINCT color, ciudad
FROM			p;

SELECT DISTINCT p1.color, p2.ciudad
FROM			p AS p1, p AS p2;
