% EJERCICIO 3

% Hospital A
A_bajo_cirugias = 100;
A_bajo_exitosas = 98;

A_alto_cirugias = 100;
A_alto_exitosas = 60;

% Hospital B
B_bajo_cirugias = 300;
B_bajo_exitosas = 288;

B_alto_cirugias = 100;
B_alto_exitosas = 55;

% Tasas Hospital A
A_bajo = (A_bajo_exitosas / A_bajo_cirugias) * 100;
A_alto = (A_alto_exitosas / A_alto_cirugias) * 100;

A_global = ((A_bajo_exitosas + A_alto_exitosas) / ...
    (A_bajo_cirugias + A_alto_cirugias)) * 100;

% Tasas Hospital B
B_bajo = (B_bajo_exitosas / B_bajo_cirugias) * 100;
B_alto = (B_alto_exitosas / B_alto_cirugias) * 100;

B_global = ((B_bajo_exitosas + B_alto_exitosas) / ...
    (B_bajo_cirugias + B_alto_cirugias)) * 100;

fprintf("HOSPITAL A\n");
fprintf("Bajo riesgo: %.2f%%\n", A_bajo);
fprintf("Alto riesgo: %.2f%%\n", A_alto);
fprintf("Global: %.2f%%\n\n", A_global);

fprintf("HOSPITAL B\n");
fprintf("Bajo riesgo: %.2f%%\n", B_bajo);
fprintf("Alto riesgo: %.2f%%\n", B_alto);
fprintf("Global: %.2f%%\n", B_global);