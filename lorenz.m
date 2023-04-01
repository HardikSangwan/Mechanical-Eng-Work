function [A, t] = lorenz(rho, x0)
%initial variables
y0 = 1;
z0 = 0;
relerr = 1e-6;
abserr = 1e-8;
t = linspace(0, 100, 50000);

%Integration
options = odeset('RelTol', relerr, 'AbsTol', abserr);
[t, A] = ode45(@(t, A) fun(A, rho), t, [x0 y0 z0], options);

%function for lorenz
function dA = fun(A, rho)
    sigma = 10;
    beta = 8/3;
    dA = zeros(3,1);
    dA(1) = sigma * (A(2) - A(1));
    dA(2) = A(1) * (rho - A(3)) - A(2);
    dA(3) = A(1) * A(2) - beta * A(3);
end
end
