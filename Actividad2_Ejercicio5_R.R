# EJERCICIO 5

gasto_fijo <- 180
coeficiente <- 0.25

ingreso <- 2000

# Gasto mensual
gasto_mensual <- gasto_fijo +
  coeficiente * ingreso

# Porcentaje del ingreso
porcentaje_ingreso <- (gasto_mensual / ingreso) * 100

# Aumento para $1000
aumento_gasto <- coeficiente * 1000

cat("Gasto mensual estimado: $",
    gasto_mensual, "\n")

cat("Aumento del gasto por $1000 adicionales: $",
    aumento_gasto, "\n")

cat("Porcentaje del ingreso:",
    porcentaje_ingreso, "%\n")