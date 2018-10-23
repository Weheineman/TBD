-- ~ Ejercicio 29: Repetir el ejercicio 24 utilizando EXISTS en la solución.
-- ~ Obtener los números de los proyectos donde se utilice al menos una de las partes suministradas por el
-- ~ proveedor S1.

SELECT      DISTINCT jCod
FROM        spj AS spj1
WHERE       EXISTS
            (SELECT     * 
             FROM       spj
             WHERE      spj.sCod = 'S1'
             AND        spj.pCod = spj1.pCod);
