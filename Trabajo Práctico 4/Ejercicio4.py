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



#~ Set3
#~ ALFA = ['B', 'D']
ERE3 = ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J']
EFE3 = [ (['A'], ['I']), (['A', 'B'],['C']), (['A', 'D'],['G', 'H']), (['B', 'D'],['E', 'F']), (['H'],['J']) ]

#~ Set4
#~ ALFA = ['A', 'C']
ERE4 = ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H']
EFE4 = [ (['A'], ['B', 'C']), (['C'],['D']), (['D'],['G']), (['E', 'A']), (['E', 'H']), (['H'], ['E']) ]

#~ Set5
#~ ALFA = ['F', 'G']
ERE5 = ['A', 'B', 'C', 'D', 'E', 'F', 'G']
EFE5 = [ (['A'], ['F']), (['A'],['G']), (['B'],['E']), (['C', 'D']), (['D', 'B']), (['E'], ['A']), (['F', 'G'], ['C']) ]

#~ Set6
ERE6 = ['A','B','C','D','E']
EFE6 = [(['A', 'B'], ['E']), (['A', 'B'], ['C']), (['A', 'B'], ['D']), (['A', 'C', 'D'], ['E']), (['A', 'C', 'D'], ['B'])]
		
	
	
	
	
