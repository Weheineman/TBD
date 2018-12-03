def cierreAlfa(alfa, F):
	resultado = set(alfa)
	cantidad = -1
	nuevaCantidad = len(resultado)
	while(cantidad != nuevaCantidad):
		cantidad = nuevaCantidad
		for (x, y) in F:
			if x < resultado or x == resultado:
				resultado = resultado | y
		nuevaCantidad = len(resultado)
	return resultado


def partes(lista):
	if lista == []: 
		return []
	head = lista[0]
	subconjuntos  = partes(lista[1:])
	subconjuntos2 = [ [head] + x for x in subconjuntos]
	return [[head]] + subconjuntos + subconjuntos2	


def filtrar(cant, conjunto):
	return [x for x in conjunto if len(x) == cant]


def clavesCandidatas(R, F):
	cantAtributos = len(R)
	dependencias = [(set(x), set(y)) for (x,y) in F]
	basica = set(R)
	for (x, y) in dependencias:
		basica = basica - y
	
	clavePosible = basica
	largoClavePosible = len(clavePosible)
	cierreClavePosible = cierreAlfa(clavePosible, dependencias)
	largoCierrePosible = len(cierreClavePosible)
	if(largoCierrePosible == cantAtributos):
		resultado = [list(clavePosible)]
	else:					
		restantes = set(R) - cierreClavePosible
		resultado = []
		cantExtra = 0
		while (restantes != set() and cantExtra <= cantAtributos - largoCierrePosible):
			cantExtra += 1
			posibles = map(set, filtrar(cantExtra, partes(list(restantes))))
			for extra in posibles:
				intento = basica | extra
				if(len(cierreAlfa(intento, dependencias)) == cantAtributos):
					resultado = resultado + [list(intento)]
					restantes = restantes - extra
		
	return resultado


# ~ Set3
# ~ ARGUMENTOS:
ERE3 = ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J']
EFE3 = [ (['A'], ['I']), (['A', 'B'],['C']), (['A', 'D'],['G', 'H']), (['B', 'D'],['E', 'F']), (['H'],['J']) ]
# ~ RESULTADO OBTENIDO
# ~ CLAVES = [['D', 'A', 'B']]

# ~ Set4
# ~ ARGUMENTOS:
ERE4 = ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H']
EFE4 = [ (['A'], ['B', 'C']), (['C'],['D']), (['D'],['G']), (['E', 'A']), (['E', 'H']), (['H'], ['E']) ]
# ~ RESULTADO OBTENIDO
# ~ CLAVES = [['F', 'H'], ['F', 'E']]

# ~ Set5
# ~ ARGUMENTOS:
ERE5 = ['A', 'B', 'C', 'D', 'E', 'F', 'G']
EFE5 = [ (['A'], ['F']), (['A'],['G']), (['B'],['E']), (['C', 'D']), (['D', 'B']), (['E'], ['A']), (['F', 'G'], ['C']) ]
# ~ RESULTADO OBTENIDO
# ~ CLAVES = [['A'], ['E'], ['D'], ['C'], ['B'], ['F', 'G']]



#Calcula las claves candidatas y las imprime en pantalla	
def main(ERE, EFE, n):
    print("Claves candidatas del Set "+ str(n) +": ", end = "")
    print(clavesCandidatas(ERE, EFE))

if __name__ == "__main__":
    main(ERE3,EFE3,3)
    main(ERE4,EFE4,4)
    main(ERE5,EFE5,5)	
	
	
	
