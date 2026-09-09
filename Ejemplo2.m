%% Ejemplo 2: Regresion lineal con gradiente descendente (datos de clase)
clc; clear; close all;
rng(42);
m = 50;
X = 2 * rand(m, 1);
y = 4 + 3 * X + randn(m, 1);

alpha = 0.1; num_iters = 1000;
theta = zeros(2, 1);
X_aug = [ones(m,1), X];
J_history = zeros(num_iters, 1);

for iter = 1:num_iters
    h = X_aug * theta;
    error = h - y;
    grad0 = (1/m) * sum(error);
    grad1 = (1/m) * sum(error .* X);
    theta = theta - alpha * [grad0; grad1];
    J_history(iter) = (1/(2*m)) * sum(error.^2);
end
fprintf('theta0 = %.4f (esperado ~4)\n', theta(1));
fprintf('theta1 = %.4f (esperado ~3)\n', theta(2));
