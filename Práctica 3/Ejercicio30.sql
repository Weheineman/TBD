-- ~ Ejercicio 30: Obtener los números de los proyectos a los cuales no suministra ninguna parte roja ninguno de los
-- ~ proveedores de Londres.

SELECT		DISTINCT jCod
FROM		spj
GROUP BY	jCod
HAVING		EXISTS
			(SELECT		*
			 FROM		s
			 WHERE		ciudad = 'Londres'
			 AND		spj.sCod = s.sCod
			 AND		EXISTS
						(SELECT		*
						 FROM		p
						 WHERE		color = 'Rojo'
						 AND		spj.pCod = p.pCod));

-- ~ SELECT	DISTINCT jCod
-- ~ FROM	j
-- ~ WHERE	NOT EXISTS
		-- ~ (SELECT		*
		 -- ~ FROM		spj
		 -- ~ WHERE		spj.jCod = j.jCod
		 -- ~ AND		EXISTS
					-- ~ (SELECT *
					 -- ~ FROM	p
					 -- ~ WHERE	spj.pCod = p.pCod
					 -- ~ AND	p.color = 'Rojo'
					 -- ~ AND	EXISTS
							-- ~ (SELECT		*
							 -- ~ FROM		s
							 -- ~ WHERE		spj.sCod = s.sCod
							 -- ~ AND		s.ciudad = 'Londres')));
