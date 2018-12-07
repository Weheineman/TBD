# ~ Dado un conjunto A, devuelve el conjunto partes de A (ambos
# ~ representados como listas).
def partes(lista):
    if lista == []:
        return []
    if len(lista) == 1:
        return [[lista[0]]]
    head = lista[0]

    # ~ Subconjuntos que contienen el primer elemento
    subconjuntos = partes(lista[1:])
    # ~ Subconjuntos que no contienen el primer elemento
    subconjuntos2 = [[head] + x for x in subconjuntos]
    return [[head]] + subconjuntos + subconjuntos2


# ~ Dados dos conjuntos, devuelve su union (todo representado
# ~ con listas)
def unirListas(a, b):
    lista = [x for x in a]
    for valor in b:
        if valor not in lista:
            lista.append(valor)
    return lista


# ~ Dados dos conjuntos representados como listas, devuelve True si son
# ~ iguales y False si no lo son.
def igualarListas(a, b):
    if len(a) != len(b):
        return False
    for (index1, valor1) in enumerate(a):
        if valor1 != b[index1]:
            return False
    return True

# ~ Dado un conjunto de relaciones R y un conjunto de dependencias
# ~ funcionales F representados respectivamente como una lista y una
# ~ lista de pares, devuelve la clausura de F en R como una lista
# ~ de pares.
def clausuraF(F, R):
    # ~ Incluimos F en el resultado. El sorted es para que en cada
    # ~ dependencia funcional los caracteres queden en orden alfabetico.
    resultado = [(sorted(x), sorted(y)) for (x, y) in F]
    partesR = partes(R)

    # ~ Reflexividad
    for alpha in partesR:
        for subAlpha in partes(alpha):
            tupla = (alpha, subAlpha)
            if tupla not in resultado:
                resultado.append(tupla)

    # ~ Asignamos a cantidad un valor distinto a nuevaCantidad asi entra
    # ~ al menos una vez al while
    cantidad = -1
    nuevaCantidad = len(resultado)
    # ~ Mientras haya cambios
    while (cantidad != nuevaCantidad):
        cantidad = nuevaCantidad

        # ~ Aumentatividad
        for (alpha, beta) in resultado:
            for gamma in partesR:
                resultado = unirListas(resultado,
                                       [(sorted(unirListas(alpha, gamma)),
                                         sorted(unirListas(beta, gamma)))])

        # ~ Transitividad
        for (alpha, beta) in resultado:
            for (alpha2, beta2) in resultado:
                if igualarListas(beta, alpha2):
                    resultado = unirListas(resultado, [(alpha, beta2)])

        nuevaCantidad = len(resultado)

    return resultado


EFE = [(['A', 'B'], ['C']), (['B', 'D'], ['E', 'F'])]
ERE = ['A', 'B', 'C', 'D', 'E', 'F']

# ~ Resultado: 1081


# ~ Calcula la clausura de EFE, ERE e imprime su cardinalidad en pantalla.
def pepe():
    print((len(clausuraF(EFE, ERE))))


if __name__ == "__main__":
    pepe()
