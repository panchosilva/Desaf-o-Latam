import sys

p = float(sys.argv[1])
u = int(sys.argv[2])
g = float(sys.argv[3])

utilidades = p*u-g

print(f"""Ojo que el orden de los argumentos es:
1) Precio de venta de un servicio
2) Número de usuarios suscritos
3) Gastos asociados

Sus utilidades son de {utilidades}""")