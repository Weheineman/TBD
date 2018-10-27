-- ~ Ejercicio 32: Construir una lista ordenada de todas las ciudades en las cuales esté situado por lo menos un
-- ~ proveedor, una parte o un proyecto.

SELECT	DISTINCT *
FROM	SELECT		ciudad
		FROM		s
		
		UNION
		
		SELECT		ciudad
		FROM		p
		
		UNION
		
		SELECT		ciudad
		FROM		j;

