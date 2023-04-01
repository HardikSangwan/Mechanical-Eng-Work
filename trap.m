function Q = trap(fun,a,b,n)

y = fun(linspace(a,b,n+1)); %Vector with function values
sumy = 2 * sum(y) - (fun(a) + fun(b));
Q = (b-a)*sumy/(n*2); %Equation for trapezoidal rule
