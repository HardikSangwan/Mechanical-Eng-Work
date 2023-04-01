clear all% close all
%% Input Parameters and Function Definition
T = 1;
t = 0:0.001:T;
y = 1-heaviside(t-T/2);
w0 = 2*pi/T;%% Create coefficient function handles
anfun = @(x,n) 2.*((1-heaviside(x-0.5)) .* sin(2.*pi.*n.*x));
bnfun = @(x,n) 2.*((1-heaviside(x-0.5)) .* cos(2.*pi.*n.*x));
a0fun = @(x) 1-heaviside(x-0.5);%% Evaluate DC Term
a0 = integral(@(x)a0fun(x),0,1);%% Fourier series for n coefficients
n = 10;
an = zeros(1,n);
bn = zeros(1,n);
f = a0;
for i=1:n
    an(i) = integral(@(x)anfun(x,i),0,1);
    bn(i) = integral(@(x)bnfun(x,i),0,1);
    f = f + an(i).*sin(2.*pi.*t.*i) + bn(i).*cos(2.*pi.*t.*i);
end%% Plot results
figure(1)
plot(t,y,t,f,'linewidth',2)
xlabel('Time [s]','fontsize',14)
ylabel('Amplitude [arb]','fontsize',14)
title('Fourier Series approximations of Inverse Heaviside Function')
legend('f(t)',['n = ',num2str(n)])
figure(2)
plot(w0.*(0:n),[a0,(an.^2 + bn.^2).^(1/2)],'o','linewidth',2)
xlabel('Frequency [rad/s]','fontsize',14)
ylabel('Amplitude [arb]','fontsize',14)
title('Amount of signal contribution by frequency (a_n^2 + b_n^2)^1^/^2')
figure(3)
subplot(2,1,1)
plot(w0.*(1:n),an,'o','linewidth',2)
ylim([0 1])
xlabel('Frequency [rad/s]','fontsize',12)
ylabel('Amplitude [arb]','fontsize',12)
title('a_n coefficient values')
subplot(2,1,2)
plot(w0.*(1:n),bn,'o','linewidth',2)
ylim([0 1])
xlabel('Frequency [rad/s]','fontsize',12)
ylabel('Amplitude [arb]','fontsize',12)
title('b_n coefficient values')
ylabel('Amplitude [arb]','fontsize',12)
title('b_n coefficient values')