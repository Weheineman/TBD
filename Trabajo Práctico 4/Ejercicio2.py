# ~ Dado un conjunto de atributos alfa y un conjunto de dependencias 
# ~ funcionales F, devuelve el cierre de alfa bajo F.
def cierreAlfa(ALFA, EFE):
	resultado = set(ALFA)
	dependencias = [(set(x), set(y)) for (x,y) in EFE]
	cantidad = -1
	nuevaCantidad = len(resultado)
	while(cantidad != nuevaCantidad):
		cantidad = nuevaCantidad
		
		for (x, y) in dependencias:
			if x < resultado or x == resultado:
				resultado = resultado | y
		
		nuevaCantidad = len(resultado)
		
	return list(resultado)


# ~ Set3
# ~ ARGUMENTOS:
ALFA1 = ['B', 'D']
EFE1  = [ (['A'], ['I']), (['A', 'B'],['C']), (['A', 'D'],['G', 'H']), (['B', 'D'],['E', 'F']), (['H'],['J']) ]
# ~ RESULTADO OBTENIDO
# ~ ALFA+ = ['E', 'B', 'D', 'F']

# ~ Set4
# ~ ARGUMENTOS:
ALFA2 = ['A', 'C']
EFE2  = [ (['A'], ['B', 'C']), (['C'],['D']), (['D'],['G']), (['E', 'A']), (['E', 'H']), (['H'], ['E']) ]
# ~ RESULTADO OBTENIDO
# ~ ALFA+ = ['C', 'D', 'A', 'G', 'B']

# ~ Set5
# ~ ARGUMENTOS:
ALFA3 = ['F', 'G']
EFE3  = [ (['A'], ['F']), (['A'],['G']), (['B'],['E']), (['C', 'D']), (['D', 'B']), (['E'], ['A']), (['F', 'G'], ['C']) ]
# ~ RESULTADO OBTENIDO
# ~ ALFA+ = ['B', 'E', 'C', 'D', 'F', 'A', 'G']



# ~ Calcula el cierre de alfa y lo imprime en pantalla
def main(ALFA, EFE, n):
    print("Alfa"+ str(n) +"+: ", end = "")
    print(cierreAlfa(ALFA, EFE))

if __name__ == "__main__":
    main(ALFA1,EFE1,1)
    main(ALFA2,EFE2,2)
    main(ALFA3,EFE3,3)
