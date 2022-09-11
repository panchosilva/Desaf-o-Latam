import string

abecedario = string.ascii_lowercase

def gen(n_de_letras):
    resultado = ""
    i = 0
    while i < int(n_de_letras):
        resultado +=abecedario[i]
        i +=1
    return resultado

def letra_o(n):
    i = 0
    while i < n:
            if (i == 0) or (i == (n-1)):
                print("*"*n)
                i +=1
            else:
                print("*"+" "*(n-2)+"*")
                i +=1

def letra_i(n):

    if n %2 == 0:
        n = n+1

#Recordar que "n" va a quedar siempre impar

    i = 0
    while i < n:
            if (i == 0) or (i == (n-1)):
                print("*"*n)
                i +=1
            else:
                print(" "*(int((n-1)/2))+"*"+" "*(int((n-1)/2)))
                i +=1

def letra_x(n):

    if n %2 == 0:
        n +=1

#Recordar que "n" va a quedar siempre impar

    for i in range(n):
        for j in range(n):
            if (i == j) or (i+j == (n-1)):
                print("*",end="")
                j += 1
            else:
                print(" ",end="")
                j += 1
        print("")
        i += 1