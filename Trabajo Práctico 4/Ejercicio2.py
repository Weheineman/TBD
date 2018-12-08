# ~ Dado un conjunto de atributos alfa y un conjunto de dependencias
# ~ funcionales F, devuelve el cierre de alfa bajo F.
def cierreAlfaAux(ALFA, EFE):
    resultado = set(ALFA)
    dependencias = [(set(x), set(y)) for (x, y) in EFE]
    cantidad = -1
    nuevaCantidad = len(resultado)
    while (cantidad != nuevaCantidad):
        cantidad = nuevaCantidad

        for (x, y) in dependencias:
            if x < resultado or x == resultado:
                resultado = resultado | y

        nuevaCantidad = len(resultado)

    return list(resultado)


def cierreAlfa(ALFA, EFE):
    return (sorted(cierreAlfaAux(ALFA, EFE)))


# ~ Set3
# ~ ARGUMENTOS:
ALFA3 = ['B', 'D']
EFE3 = [(['A'], ['I']), (['A', 'B'], ['C']), (['A', 'D'], ['G', 'H']),
        (['B', 'D'], ['E', 'F']), (['H'], ['J'])]
# ~ RESULTADO OBTENIDO
# ~ ALFA3+: ['B', 'D', 'E', 'F']

# ~ Set4
# ~ ARGUMENTOS:
ALFA4 = ['A', 'C']
EFE4 = [(['A'], ['B', 'C']), (['C'], ['D']), (['D'], ['G']), (['E', 'A']),
        (['E', 'H']), (['H'], ['E'])]
# ~ RESULTADO OBTENIDO
# ~ ALFA4+: ['A', 'B', 'C', 'D', 'G']

# ~ Set5
# ~ ARGUMENTOS:
ALFA5 = ['F', 'G']
EFE5 = [(['A'], ['F']), (['A'], ['G']), (['B'], ['E']), (['C', 'D']),
        (['D', 'B']), (['E'], ['A']), (['F', 'G'], ['C'])]
# ~ RESULTADO OBTENIDO
# ~ ALFA5+: ['A', 'B', 'C', 'D', 'E', 'F', 'G']


# ~ Calcula el cierre de alfa y lo imprime en pantalla.
def main(ALFA, EFE, n):
    print("Alfa" + str(n) + "+: ", end="")
    print(cierreAlfa(ALFA, EFE))


if __name__ == "__main__":
    main(ALFA3, EFE3, 3)
    main(ALFA4, EFE4, 4)
    main(ALFA5, EFE5, 5)
