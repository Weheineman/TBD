def partes(lista):
	if lista == []: 
		return []
	if len(lista) == 1:
		return [[lista[0]]]
	head = lista[0]
	subconjuntos  = partes(lista[1:])
	subconjuntos2 = [ [head] + x for x in subconjuntos]
	return [[head]] + subconjuntos + subconjuntos2

def setPartes(lista):
	return set([frozenset(x) for x in partes(lista)])



#~ def clausuraF (F, R):
	#~ #Ver si esto tiene que quedar ahí.
	#~ resultado = set([(frozenset(x), frozenset(y)) for (x,y) in F])
	#~ print("Llegue a hacer el primer set")
	#~ partesAtrib = setPartes(R)
	#~ print("Llegue a hacer setPartes")
	#~ for alpha in partes(R):
		#~ for x in setPartes(alpha):
			#~ resultado.add((frozenset(alpha), x))

	#~ print("Llegue a hacer el primer for largo")
	#~ condicion = True
	#~ while (condicion):
		#~ nuevosPares = set()
		#~ nuevosPares2 = set()
		
		#~ for (alpha, beta) in resultado:
			#~ for gamma in partesAtrib:
				#~ nuevosPares.add((alpha | gamma, beta | gamma))
		
		#~ resultado = resultado | nuevosPares
		
		#~ for (alpha, beta) in resultado:
			#~ for (alpha2, beta2) in resultado:
				#~ if beta == alpha2:
					#~ nuevosPares2.add((alpha, beta2))
		
		#~ resultado = resultado | nuevosPares2
		
		#~ print("Hice el primer ciclo. nuevosPares: ", nuevosPares, ". nuevosPares2: ", nuevosPares2)
		#~ condicion = len(nuevosPares) != 0 or len(nuevosPares2) != 0
		
	#~ return resultado

def unirListas(a, b):
	lista = [x for x in a]
	for valor in b:
		if valor not in lista:
			lista += [valor]
	return lista

def igualarListas(a,b):
	if len(a) != len(b):
		return False
	for (index1, valor1) in enumerate(a):
		if valor1 != b[index1]:
			return False
	return True

def clausuraF (F, R):
	resultado = [(sorted(x), sorted(y)) for (x,y) in F]
	partesAtrib = [sorted(x) for x in partes(R)]
	for alpha in partesAtrib:
		for x in partes(alpha):
			tupla = (alpha, x)
			if tupla not in resultado:
				resultado += [tupla]

	cantidad = -1
	nuevaCantidad = len(resultado)
	i = 0
	while (cantidad != nuevaCantidad):
		cantidad = nuevaCantidad
		
		for (alpha, beta) in resultado:
			for gamma in partesAtrib:
				resultado = unirListas(resultado, [( sorted(unirListas(alpha, gamma)) , sorted(unirListas(beta, gamma)) )])
		
		for (alpha, beta) in resultado:
			for (alpha2, beta2) in resultado:
				if igualarListas(beta, alpha2):
					resultado = unirListas(resultado, [(alpha, beta2)])
		
		nuevaCantidad = len(resultado)
		
	return resultado

EFE = [(['A', 'B'], ['C']), (['B', 'D'], ['E', 'F'])]
ERE = ['A', 'B', 'C', 'D', 'E', 'F']

def pepe():
	print(len(clausuraF(EFE, ERE)))
