function project4a
L = [5e-3 10e-3 20e-3 50e-3 100e-3];
C = [1.25e-6 2.5e-6 5e-6 12.5e-6 25e-6];
R = [27 56 100 200 370];
opt = stepDataOptions('StepAmplitude',12);
linestyle = ['-',':','-','-.',':','-.',':'];
for i=1:5
    sys = tf([C(3) 0], [L(3)*C(3) C(3)*R(i) 1]); 
    y = step(sys, opt);
    plot(y, linestyle(i));
    xlim([0 500]);
    hold on
end
legend('1','2','3','4','5');

figure
for j=1:5
    sys2 = tf([C(j) 0],[L(j)*C(j) C(j)*R(2) 1]); 
    y2 = step(sys2, opt);
    plot(y2);
    hold on
end
legend('1','2','3','4','5');