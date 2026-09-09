# EJERCICIO 2

hombres <- 400
mujeres <- 600

porcentaje_hombres <- 0.35
porcentaje_mujeres <- 0.45

# Personas que aprueban
hombres_aprueban <- hombres * porcentaje_hombres
mujeres_aprueban <- mujeres * porcentaje_mujeres

# Totales
total_aprueban <- hombres_aprueban + mujeres_aprueban
total_personas <- hombres + mujeres

# Porcentaje global
porcentaje_global <- (total_aprueban / total_personas) * 100

cat("Porcentaje global de aprobación:",
    porcentaje_global, "%\n")
