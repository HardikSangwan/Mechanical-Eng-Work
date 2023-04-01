function Q = dint(fun, a, b, n, method)

y = fun(linspace(a, b, n + 1)); %Vector with function values
h = (b - a)/n; %step size

if (nargin == 4)
    method = 'simp';
end

if strcmp(method,'trap')
    sumy = 2 .* sum(y) - (fun(a) + fun(b));
    Q = h .* sumy ./ 2; %Equation for trapezoidal rule
else
    if(mod(n, 2) == 0)
        sumy = y(1) + 4 .* sum(y(2:2:end)) + 2 .* sum(y(3:2:end - 1)) + y(end);
        Q = h .* sumy ./ 3;
    else
        fprintf('Simpson''s Method requires even subintervals.'); 
        fprintf('Please try again \n');
    end
end

    