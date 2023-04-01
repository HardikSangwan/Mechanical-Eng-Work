function y = odeRalston(fun, x, y0)

for i = 1 : length(x) - 1
    h = x(i+1) - x(i);
    k1 = fun(x(i),y0(:,i));
    k2 = fun(x(i) + 0.75*h, y0(:,i) + 0.75 * h * k1);
    phi = (k1+ 2*k2)/3;
    y0(:,i+1) = y0(:,i) + phi * h;
end

y = y0;