#Dado alfa y F, devuelve el cierre de alfa.
def cierreAlfa(alfa, F):
	resultado = alfa
	cantidad = -1
	nuevaCantidad = len(resultado)
	while(cantidad != nuevaCantidad):
		cantidad = nuevaCantidad
		for (x, y) in F:
			if x < resultado or x == resultado:
				resultado = resultado | y
		nuevaCantidad = len(resultado)
	return resultado


#Dadas dos listas de conjuntos (parcialChico y parcialGrande), devuelve una 
#lista con los elementos de parcialChico y los elementos de parcialGrande 
#que no incluyen a ningún elemento de parcialChico.
def noContenidos(parcialChico, parcialGrande):
	resultado = []
	for conjunto in parcialGrande:
		flag = False
		for subconjunto in parcialChico:
			if(subconjunto <= conjunto):
				flag = True
				break
		
		if(not flag):
			resultado = resultado + [conjunto]
	return resultado + parcialChico


#Dado un conjunto de dependencias, la cantidad de atributos, un conjunto base 
#y un conjunto de atributos, calcula el conjunto de claves posibles.
def calcularClaves(dependencias, cantAtributos, base, atributos):
	if(atributos == []):
		return []
	
	posibleClave = base.copy()
	posibleClave.add(atributos[0])
	if(len(cierreAlfa(posibleClave, dependencias)) == cantAtributos):
		return [posibleClave] + calcularClaves(dependencias, cantAtributos, base, atributos[1:])
	
	parcial1 = calcularClaves(dependencias, cantAtributos, base, atributos[1:])
	parcial2 = calcularClaves(dependencias, cantAtributos, posibleClave, atributos[1:])

	return noContenidos(parcial1, parcial2)


#Dado R y F, devuelve el conjunto de claves candidatas, de forma no ordenada.	
def clavesCandidatasAux(R, F):
	cantAtributos = len(R)
	dependencias = [(set(x), set(y)) for (x,y) in F]
	basica = set(R)
	for (x, y) in dependencias:
		basica = basica - y
	
	clavePosible = basica
	cierrePosible = cierreAlfa(clavePosible, dependencias)
	if(len(cierrePosible) == cantAtributos):
		resultado = [list(clavePosible)]
	else:
		restantes = [x for x in R if x not in cierrePosible]
		resultado = calcularClaves(dependencias, cantAtributos, clavePosible, restantes)
		resultado = list(map(list, resultado))
		
	return resultado


#Dado R y F, devuelve el conjunto de claves candidatas, de forma ordenada.	
def clavesCandidatas(R, F):
	return(sorted(map(sorted, clavesCandidatasAux(R, F))))
		

# ~ Set3
# ~ ARGUMENTOS:
ERE3 = ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J']
EFE3 = [ (['A'], ['I']), (['A', 'B'],['C']), (['A', 'D'],['G', 'H']), (['B', 'D'],['E', 'F']), (['H'],['J']) ]
# ~ RESULTADO OBTENIDO
# ~ CLAVES = [['A', 'B', 'D']]

# ~ Set4
# ~ ARGUMENTOS:
ERE4 = ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H']
EFE4 = [ (['A'], ['B', 'C']), (['C'],['D']), (['D'],['G']), (['E', 'A']), (['E', 'H']), (['H'], ['E']) ]
# ~ RESULTADO OBTENIDO
# ~ CLAVES = [['E', 'F'], ['F', 'H']]

# ~ Set5
# ~ ARGUMENTOS:
ERE5 = ['A', 'B', 'C', 'D', 'E', 'F', 'G']
EFE5 = [ (['A'], ['F']), (['A'],['G']), (['B'],['E']), (['C', 'D']), (['D', 'B']), (['E'], ['A']), (['F', 'G'], ['C']) ]
# ~ RESULTADO OBTENIDO
# ~ CLAVES = [['A'], ['B'], ['C'], ['D'], ['E'], ['F', 'G']]

# ~ Set6
# ~ Set extra que pensamos, que tiene múltiples claves candidatas.
# ~ ARGUMENTOS:
ERE6 = ['A', 'B', 'C', 'D', 'E', 'F']
EFE6 = [ (['B'], ['C']), (['C'],['B']), (['D'],['E', 'F']), (['E','F'],  ['D'])]
# ~ RESULTADO OBTENIDO
# ~ CLAVES = [['A', 'B', 'D'], ['A', 'B', 'E', 'F'], ['A', 'C', 'D'], ['A', 'C', 'E', 'F']]



#Calcula las claves candidatas y las imprime en pantalla.	
def main(ERE, EFE, n):
    print("Claves candidatas del Set "+ str(n) +": ", end = "")
    print(clavesCandidatas(ERE, EFE))

if __name__ == "__main__":
    main(ERE3,EFE3,3)
    main(ERE4,EFE4,4)
    main(ERE5,EFE5,5)
    main(ERE6,EFE6,6)
	
	
