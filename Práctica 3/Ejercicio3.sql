-- ~ Ejercicio 3: Obtener los números de los proveedores que suministran partes al proyecto J1, ordenados por número de proveedor.
SELECT		sCod
FROM		spj
WHERE		jCod = 'J1'
ORDER BY 	sCod;
