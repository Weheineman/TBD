def cierreAlfa(alfa, F):
	resultado = set(alfa)
	dependencias = [(set(x), set(y)) for (x,y) in F]
	cantidad = -1
	nuevaCantidad = len(resultado)
	while(cantidad != nuevaCantidad):
		cantidad = nuevaCantidad
		
		for (x, y) in dependencias:
			if x < resultado or x == resultado:
				resultado = resultado | y
		
		nuevaCantidad = len(resultado)
		
	return list(resultado)

#~ Set3
#~ ALFA = ['B', 'D']
#~ EFE = [ (['A'], ['I']), (['A', 'B'],['C']), (['A', 'D'],['G', 'H']), (['B', 'D'],['E', 'F']), (['H'],['J']) ]

#~ Set4
#~ ALFA = ['A', 'C']
#~ EFE = [ (['A'], ['B', 'C']), (['C'],['D']), (['D'],['G']), (['E', 'A']), (['E', 'H']), (['H'], ['E']) ]

#~ Set5
#~ ALFA = ['F', 'G']
#~ EFE = [ (['A'], ['F']), (['A'],['G']), (['B'],['E']), (['C', 'D']), (['D', 'B']), (['E'], ['A']), (['F', 'G'], ['C']) ]


def pepe():
	print(cierreAlfa(ALFA, EFE))
