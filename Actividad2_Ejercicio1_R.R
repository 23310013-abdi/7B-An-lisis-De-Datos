# EJERCICIO 1

ventas_inicial <- 200000
ventas_final <- 260000

costos_inicial <- 120000
costos_final <- 150000

# Aumento de ventas
aumento_ventas <- ((ventas_final - ventas_inicial) /
                     ventas_inicial) * 100

# Aumento de costos
aumento_costos <- ((costos_final - costos_inicial) /
                     costos_inicial) * 100

# Utilidades
utilidad_inicial <- ventas_inicial - costos_inicial
utilidad_final <- ventas_final - costos_final

# Aumento de utilidad
aumento_utilidad <- ((utilidad_final - utilidad_inicial) /
                       utilidad_inicial) * 100

cat("Aumento de ventas:", aumento_ventas, "%\n")
cat("Aumento de costos:", aumento_costos, "%\n")
cat("Aumento de utilidad:", aumento_utilidad, "%\n")