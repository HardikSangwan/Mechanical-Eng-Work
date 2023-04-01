function dydx = odefun(x, y)
dydx = x - y.* x/2000;