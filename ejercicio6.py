# Ejercicio 6
# Crear una tupla en Python con el nombre de “Historial2” la cual contenga los siguientes valores:
# 23500, 5960, 2300, 10200, 8900
# Que representa montos de atención en pesos por diferentes servicios/consultas de la mascota “Frida”.
# Calcular el monto total gastado a lo largo del tiempo por atención de “Frida”. 
# Crear una función que cuente cuantos gastos fueron superiores a 5000 mostrando  el número calculado en pantalla.

print('Resolución ejercicio 6')

# Tupla de los montos gastados para Frida
Historial2 = (23500, 5960, 2300, 10200, 8900)

# Calculo del monto total gastado por Frida
MontoGastado = sum(list(Historial2))
print("El monto total gastado es $" + str(MontoGastado))

#Función que muestra los gastos superiores a 5000 y cuantos fueron 
num = 0

for i in range (0,len(Historial2),1):
    if Historial2 [i] > 5000:
        num +=1


print ( "Los valores que superan los $5000 son " + str(num))