# EJERCICIO 3

# Hospital A
A_bajo_cirugias <- 100
A_bajo_exitosas <- 98

A_alto_cirugias <- 100
A_alto_exitosas <- 60

# Hospital B
B_bajo_cirugias <- 300
B_bajo_exitosas <- 288

B_alto_cirugias <- 100
B_alto_exitosas <- 55

# Tasas Hospital A
A_bajo <- (A_bajo_exitosas / A_bajo_cirugias) * 100
A_alto <- (A_alto_exitosas / A_alto_cirugias) * 100

A_global <- ((A_bajo_exitosas + A_alto_exitosas) /
               (A_bajo_cirugias + A_alto_cirugias)) * 100

# Tasas Hospital B
B_bajo <- (B_bajo_exitosas / B_bajo_cirugias) * 100
B_alto <- (B_alto_exitosas / B_alto_cirugias) * 100

B_global <- ((B_bajo_exitosas + B_alto_exitosas) /
               (B_bajo_cirugias + B_alto_cirugias)) * 100

cat("Hospital A\n")
cat("Bajo riesgo:", A_bajo, "%\n")
cat("Alto riesgo:", A_alto, "%\n")
cat("Global:", A_global, "%\n\n")

cat("Hospital B\n")
cat("Bajo riesgo:", B_bajo, "%\n")
cat("Alto riesgo:", B_alto, "%\n")
cat("Global:", B_global, "%\n")