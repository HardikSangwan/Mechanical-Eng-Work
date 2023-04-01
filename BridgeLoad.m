function [F, yc, n] = BridgeLoad

fun = @(y) y.*(4-y.^2).* tanh(y) + 0.2; %function handle for load per unit length
funy = @(y) (y.^2).*((y.*4)-(y.^4)).*tanh(y).*y + y.*0.2; % function handle for center of pressure

n=2; %initial number of subintervals

Fold = trap(fun,0,2,1); %Load for 1 subinterval
F = trap(fun,0,2,2); % Load for 2 subintervals

fprintf('I           Iold        relerr       number of subintervals\n\n');

while F-Fold>F*1e-6 %Run for a relative accuracy of 1e-6
    
    n=2*n; %Doubling the number of subintervals in each loop
    Fold=F;
    F=trap(fun,0,2,n);
    relerr = (F - Fold)/F; %Relative Error
    fprintf('%.3e   %.3e   %.3e    %.0f\n',Fold, F, relerr, n); %Print iteration results
    
end

plot(linspace(0,2,101),fun(linspace(0, 2, 101)));
title('Load per unit length vs Length');
ylabel('Load per unit length');
xlabel('Length');

yc = trap(funy, 0, 2, n)/F;

fprintf('\n\nThe total load is %.3e \nThe center of pressure is %.3e \nthe number of subintervals are %.0f \n', F, yc, n);

