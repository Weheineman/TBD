-- ~ Apartado a
UPDATE	Autor
SET 	Residencia = "Buenos Aires"
WHERE 	Nombre = "Abelardo"
AND 	Apellido = "Castillo";

-- ~ Apartado b
UPDATE	Libro
SET 	Precio = 1.1 * Precio
WHERE 	Editorial = "UNR";

-- ~ Apartado c
UPDATE	Libro
SET		Precio =
CASE
	WHEN	Precio <= 200	
	THEN	1.2 * Precio
	ELSE	1.1 * Precio
END
WHERE	ISBN IN (SELECT
				 DISTINCT ISBN
				 FROM	  Autor, Escribe
				 WHERE 	  Autor.ID = Escribe.ID
				 AND	  Autor.Nacionalidad <> "Argentina");

-- ~ Apartado d
DELETE
FROM	Libro
WHERE	ISBN IN (SELECT
			   	 DISTINCT ISBN
				 FROM	  Escribe
				 WHERE	  Año = 1998);
