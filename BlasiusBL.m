function [u, up] = BlasiusBL

x = linspace(0,10,501);
yinit = [0 0 1];
options = bvpset('RelTol',1.0e-8,'AbsTol',1.0e-12);
solinit=bvpinit(x,yinit);

    function dydx = odefun(x, y)
        dydx = [y(2); y(3);-y(1)*y(3)/2];
    end

    function res = bcfun(ya,yb)
        res = [ya(1); ya(2); yb(1)-1];
    end

sol = bvp5c(@odefun, @bcfun, solinit, options);

y = deval(sol,x);
u = y(1,:);
up = y(2,:);

figure
plot(u,x,'r',up,x,'b')
legend('Velocity','Acceleration')
title('Position vs Velocity and Acceleration')

end
