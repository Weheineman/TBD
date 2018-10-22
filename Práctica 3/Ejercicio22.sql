-- ~ Ejercicio 22: Obtener los colores de las partes suministradas por el proveedor S1.

SELECT	DISTINCT color
FROM	p
WHERE	pCod IN
		(SELECT	DISTINCT pCod
		 FROM	spj
		 WHERE	sCod = 'S1');
