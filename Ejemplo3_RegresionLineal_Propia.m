
clc; clear; close all;

%% 1. Datos (creados por el alumno, no aleatorios)
% Horas de estudio a la semana
X = [1; 2; 2.5; 3; 3.5; 4; 4.5; 5; 5.5; 6; 6.5; 7; 7.5; 8; 9];

% Calificacion obtenida en el examen (0-100)
y = [52; 55; 58; 60; 63; 66; 68; 72; 74; 78; 80; 83; 85; 88; 92];

m = length(y); % Numero de ejemplos (m = 15)

% Visualizar los datos originales
figure;
scatter(X, y, 60, 'filled');
xlabel('Horas de estudio a la semana');
ylabel('Calificacion en el examen');
title('Datos: horas de estudio vs. calificacion');
grid on;

%% 2. Preparacion de variables
% Se agrega una columna de unos a X para el termino independiente (theta0)
X_aug = [ones(m, 1), X];

% Inicializacion de parametros theta = [theta0; theta1]
theta = zeros(2, 1);

% Hiperparametros del descenso del gradiente
alpha = 0.02;       % Tasa de aprendizaje
num_iters = 3000;   % Numero de iteraciones

% Vector para guardar el historial del costo J en cada iteracion
J_history = zeros(num_iters, 1);

%% 3. Funcion de costo (Error Cuadratico Medio)
% J(theta0, theta1) = (1/2m) * sum((h(x_i) - y_i)^2)
function J = calcularCosto(X_aug, y, theta)
    m = length(y);
    h = X_aug * theta;          % Hipotesis: prediccion del modelo
    errores = h - y;            % Diferencia entre prediccion y valor real
    J = (1 / (2 * m)) * sum(errores .^ 2);
end

%% 4. Ciclo de descenso del gradiente
for iter = 1:num_iters
    h = X_aug * theta;              % Prediccion actual del modelo
    error = h - y;                  % Error de la prediccion

    % Gradientes parciales respecto a theta0 y theta1
    grad0 = (1 / m) * sum(error);
    grad1 = (1 / m) * sum(error .* X);
    grad = [grad0; grad1];

    % Regla de actualizacion: theta := theta - alpha * gradiente
    theta = theta - alpha * grad;

    % Guardar el costo de esta iteracion para graficar la convergencia
    J_history(iter) = calcularCosto(X_aug, y, theta);
end

%% 5. Resultados numericos
fprintf('--- Resultados del modelo ---\n');
fprintf('theta0 (ordenada al origen) = %.4f\n', theta(1));
fprintf('theta1 (pendiente)          = %.4f\n', theta(2));
fprintf('Costo final J(theta)        = %.4f\n', J_history(end));

% Prediccion de ejemplo: calificacion esperada con 6.5 horas de estudio
horas_prueba = 6.5;
prediccion = theta(1) + theta(2) * horas_prueba;
fprintf('Prediccion para %.1f horas de estudio: %.2f puntos\n', ...
    horas_prueba, prediccion);

%% 6. Graficas de resultados

% 6.1 Ajuste lineal sobre los datos
figure;
scatter(X, y, 60, 'filled'); hold on;
plot(X, X_aug * theta, 'r-', 'LineWidth', 2);
xlabel('Horas de estudio a la semana');
ylabel('Calificacion en el examen');
title('Regresion lineal ajustada (datos propios)');
legend('Datos reales', 'Recta ajustada', 'Location', 'best');
grid on;

% 6.2 Evolucion del costo J durante el entrenamiento
figure;
plot(1:num_iters, J_history, 'b-', 'LineWidth', 1.5);
xlabel('Iteracion');
ylabel('Costo J(\theta)');
title('Convergencia del costo (Ejemplo 3)');
grid on;

%% Notas / Complementar
% - Se probo alpha = 0.02 porque valores mayores (p.ej. 0.1) provocaban
%   oscilaciones debido a la escala de las horas de estudio (1 a 9).
% - Con mas iteraciones (3000) el costo se estabiliza y el modelo converge.
% - El modelo indica que, en promedio, cada hora adicional de estudio a la
%   semana incrementa la calificacion en aproximadamente theta1 puntos.
