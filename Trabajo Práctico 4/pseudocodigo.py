function calcularClaves (F, R, base, resto):
	if resto es vacio then
		return [];
	
	atributoActual := head(resto)
	resto := tail(resto);
	posibleClave = posibleClave U atributoActual;
	
	if posibleClave es superclave then
	    otrasClaves := calcularClaves(F, R, base, resto);
	    return [posibleClave] ++ otrasClaves;
	
	resultado := [];
	parcial1 := calcularClaves(F, R, base, resto);
	parcial2 := calcularClaves(F, R, posibleClave, resto);
	
	for each x in parcial2:
	    if ningun y en parcial1 es subconjunto de x then
	        resultado := resultado ++ [x];
    
    return resultado ++ parcial1;
end

function clavesCandidatas (R, F):
    claveBasica := R;
    for each dependencia funcional b -> c in F do
        claveBasica := claveBasica - c;
    
    if claveBasica es superclave then
        return [claveBasica];
    else
        resto := R - cierre(claveBasica, F);
        return calcularClaves (F, R, claveBasica, resto);
end    
