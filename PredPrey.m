function [maxPred, maxPrey] = PredPrey(deltaT)

funx = @(x, y) odefun(x,y);
funy = @(x, y) odefun(-y,x);
T = linspace(0, 20, 100);
x = odeRalston(funx, T, [1000 1000]);
y = odeRalston(funy, T, [1000 1000]);

figure
subplot(2,1,1)
hold on
plot(T, y, 'r')
plot(T, x, 'b')
hold off

subplot(2,1,2)
hold on
plot(x,y)
plot(x(1),y(1), 'ro')
hold off

[maxPred, maxPredIndex] = max(y);
maxPredtime = T(maxPredIndex);
[maxPrey, maxPreyIndex] = max(x);
maxPreytime = T(maxPreyIndex);
fprintf('The maximum Predator population of %.3e occurs at time t = %.3e s\n', maxPred, maxPredtime);
fprintf('The maximum Prey population of %.3e occurs at time t = %.3e s\n', maxPrey, maxPreytime);

