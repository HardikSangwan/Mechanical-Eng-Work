function [F, xcm] = Sandpile

%Position data from sandpile.png
x = [983,966,946,921,896,875,852,836,809,778,745,716,694,669,643,615,592,570,553,535,514,498,479,453,430,412,395,379,360,347,333,315,299,283,266,248,232,220,206,193,182,167,153,142,127,106,96,82,68,59,49,38,21,6];
y = [136,150,156,158,152,132,114,107,97,87,87,101,119,128,132,122,114,111,115,120,123,106,96,89,81,77,77,85,88,102,113,114,103,102,99,91,83,83,83,86,92,97,108,119,130,139,151,160,171,184,196,208,213,212];

%ratio for points to meters
pmratio = (919-704)/2;

%position in meters
xm = fliplr(x/pmratio);
ym = fliplr((300 - y)/pmratio);

%Functions for weight and center of mass

%Interpolated points
xinterp = linspace(x(1), 0, 1001);
yinterp = interp1(x, y, xinterp, 'spline');

%F and xcm calculations using dint
rho = 1990;
fun = @(x) interp1(xm, ym, x,'spline');
funcm = @(x) interp1(xm, ym, x, 'spline') .* x;

F = 9.807 * 2 * rho * dint(fun, 0, xm(end), 202,'simp');
xcm = 9.807 * 2 * rho * dint(funcm, xm(1), xm(end),202,'simp')/F;

%Plot for image, data points, interpolated points and xcm
figure
imshow('sandpile.png')
title('Sandpile Sandslide')
hold on
plot(x, y, 'ro', xinterp, yinterp, 'r', 'LineWidth', 2);
plot(xcm * pmratio, 300, 'rd');
text(xcm * pmratio, 300, '\leftarrow Center of Mass');
hold off

%Displaying results
fprintf('\n\nThe total weight is %.2f kN\n', F/1000);
fprintf('The center of mass is %.3f m\n', xcm);
fprintf('The number of subintervals are %.0f \n', 200);