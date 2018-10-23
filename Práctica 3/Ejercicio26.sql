-- ~ Ejercicio 26: Obtener los números de los proveedores cuya situación sea inferior a la del proveedor S1.

SELECT	DISTINCT sCod
FROM	s
WHERE	situacion < (SELECT situacion FROM s WHERE sCod = 'S1');
