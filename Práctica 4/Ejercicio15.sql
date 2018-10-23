-- ~ Ejercicio 15: Obtener el número total de proyectos a los cuales suministra partes el proveedor S1.

SELECT COUNT(DISTINCT jCod)
FROM	spj
WHERE	sCod = 'S1';
