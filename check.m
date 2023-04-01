function check

rho = [97 98 99 100 101 102 103];
x01 = 0;
x02 = 1e-5;
for i = 1: length(rho)
figure('units','normalized','outerposition',[0 0 1 1])
[A1, ~] = lorenz(rho(i), x01);
[A2, t] = lorenz(rho(i), x02);
subplot(3, 1, 1)
hold on
plot(t, A1(:,1))
plot(t, A2(:,1))
xlabel('t')
ylabel('x1, x2')
hold off
    
subplot(3, 1, 2)
hold on
plot(t, abs(A1(:,1) - A2(:,1)))
xlabel('t')
ylabel('|x1 - x2|')
hold off

subplot(3, 1, 3)
hold on
plot(A1(:,1),A1(:,3))
xlabel('x1')
ylabel('z1')
hold off


end