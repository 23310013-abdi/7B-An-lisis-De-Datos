%% Ejemplo 1: Descenso del gradiente en una funcion cuadratica
clc; clear; close all;
f = @(x) (x - 3).^2;      % Funcion objetivo
df = @(x) 2*(x - 3);      % Derivada (gradiente)

alpha = 0.1; max_iter = 50; x0 = -2; tolerancia = 1e-6;
x = x0; historial_x = x; historial_f = f(x);

for iter = 1:max_iter
    grad = df(x);
    x_new = x - alpha * grad;
    historial_x = [historial_x; x_new];
    historial_f = [historial_f; f(x_new)];
    if abs(x_new - x) < tolerancia
        fprintf('Convergencia en iteracion %d\n', iter);
        break;
    end
    x = x_new;
end
fprintf('Minimo: x = %.4f, f(x) = %.4f\n', x, f(x));
