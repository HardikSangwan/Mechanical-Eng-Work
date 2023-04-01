function Butterfly

%initial variables
rho = [14 28];
x01 = 0;
x02 = 1e-5;

%plot titles
title1 = strcat({'Stable Limit Cycle, '}, {texlabel('rho')}, {' = 14'});
title2 = strcat({'Strange Attractor, '}, {texlabel('rho')}, {' = 28'});
titles = [title1 title2];

%fullscreen figure
figure('units','normalized','outerposition',[0 0 1 1])

for i = 1:length(rho)
    %calling lorenz function on different initial values
    [A1, ~] = lorenz(rho(i), x01);
    [A2, t] = lorenz(rho(i), x02);
    
    %subplots
    subplot(3, 2, 1 + i - 1)
    hold on
    title(titles(i))
    plot(t, A1(:,1))
    plot(t, A2(:,1))
    xlabel('t')
    ylabel('x1, x2')
    hold off
    
    subplot(3, 2, 3 + i - 1)
    hold on
    plot(t, abs(A1(:,1) - A2(:,1)))
    xlabel('t')
    ylabel('|x1 - x2|')
    hold off

    subplot(3, 2, 5 + i - 1)
    hold on
    plot(A1(:,1),A1(:,3))
    xlabel('x1')
    ylabel('z1')
    hold off
    
    %printing mean
    fprintf('The mean of the absolute value of the difference ');
    fprintf('x1(t) - x2(t) for t > 50 for rho = %.0f is %.4e\n', rho(i), mean(abs(A1(end/2:end, 1) - A2(end/2, end))));
end

%figure for behaviour similar to rho = 100 (Periodic window)
%Examples of rho with such behaviour are 114, 126.5, 133, 166, etc
[A, ~] = lorenz(114, x01);

figure('units','normalized','outerposition',[0 0 1 1])
plot3(A(:,1),A(:,2),A(:,3))
title(strcat({'Space curve for '}, {texlabel('rho')}, {' = 114'}))
xlabel('x')
ylabel('y')
zlabel('z')

fprintf('The value of rho  is 114\n');