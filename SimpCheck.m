function [F, n] = SimpCheck

%Position data from sandpile.png
x = [983,966,946,921,896,875,852,836,809,778,745,716,694,669,643,615,592,570,553,535,514,498,479,453,430,412,395,379,360,347,333,315,299,283,266,248,232,220,206,193,182,167,153,142,127,106,96,82,68,59,49,38,21,6];
y = [136,150,156,158,152,132,114,107,97,87,87,101,119,128,132,122,114,111,115,120,123,106,96,89,81,77,77,85,88,102,113,114,103,102,99,91,83,83,83,86,92,97,108,119,130,139,151,160,171,184,196,208,213,212];

%ratio for points to meters
pmratio = (919-704)/2;

%position in meters
xm = fliplr(x/pmratio);
ym = fliplr((300 - y)/pmratio);
n = 2;
rho = 1990;
h = (xm(end) - xm(1))/n;

fun = @(x) interp1(xm, ym, x,'spline');

F = 9.807 * 2 * rho * dint(fun, 0, xm(end), n,'simp');

Fold = F/2; %Load for 1 subinterval

fprintf('F           Fold        relerr       number of subintervals\n\n');

while abs(F-Fold)>F*1e-8 %Run for a relative accuracy of 1e-6
    
    n=n+2; %Doubling the number of subintervals in each loop
    Fold=F;
    F = 9.807 * 2 * rho * dint(fun, 0, xm(end), n,'simp');
    relerr = (F - Fold)/F; %Relative Error
    fprintf('%.7e   %.7e   %.7e    %.0f\n',Fold, F, relerr, n); %Print iteration results
    if n>1500
        break
    end
    
end

fprintf('\n\nThe total load is %.3e \nThe number of subintervals are %.0f \n', F, n);

