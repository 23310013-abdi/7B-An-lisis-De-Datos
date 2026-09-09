# EJERCICIO 4

poliza <- 50
probabilidad_siniestro <- 0.02
pago_siniestro <- 2000

# Pago esperado
pago_esperado <- probabilidad_siniestro * pago_siniestro

# Ganancia esperada
ganancia_esperada <- poliza - pago_esperado

cat("Pago esperado: $", pago_esperado, "\n")
cat("Ganancia esperada por póliza: $",
    ganancia_esperada, "\n")
