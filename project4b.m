function project4b
t = (0:0.1:15);
Kd = [.1 .1 .2 1 1 2 .1];
Kp = [1 2 1 .5 2 .2 4];
linestyle = ['-',':','-','-.',':','-.',':'];
for i=1:7
    PDs = tf([Kd(i) Kp(i)],1);
    Vs = tf(1, [.004 1.5]);
    Is = tf(.06, 1);
    Ts = tf(1,[.009 .001]);
    Os = tf(1,[1 0]);
    Es = tf(.06, 1);
    sys1 = series(Vs,Is);
    sys2 = series(sys1, Ts);
    sys3 = feedback(sys2, Es);
    sys4 = series(PDs, sys3);
    sys5 = series(sys4, Os);
    sys = feedback(sys5, 1);
    y = step (sys, t);
    S = stepinfo(sys);
    sTime = getfield(S, 'SettlingTime');
    oShoot = getfield(S, 'Overshoot');
    fprintf('Case %d: Settling Time: %d Overshoot: %d\n',i,sTime,oShoot);
    plot(t, y,linestyle(i));
    hold on
end
legend('1','2','3','4','5','6','7');