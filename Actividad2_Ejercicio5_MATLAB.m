% EJERCICIO 5

gasto_fijo = 180;
coeficiente = 0.25;

ingreso = 2000;

% Gasto mensual
gasto_mensual = gasto_fijo + ...
    coeficiente * ingreso;

% Porcentaje del ingreso
porcentaje_ingreso = ...
    (gasto_mensual / ingreso) * 100;

% Aumento para $1000
aumento_gasto = coeficiente * 1000;

fprintf("Gasto mensual estimado: $%.2f\n", ...
    gasto_mensual);

fprintf("Aumento del gasto por $1000 adicionales: $%.2f\n", ...
    aumento_gasto);

fprintf("Porcentaje del ingreso: %.2f%%\n", ...
    porcentaje_ingreso);