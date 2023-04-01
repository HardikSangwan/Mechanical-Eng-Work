figure(1)
plot(DesPos); hold on;
plot(PosNonLinSquareP); hold on;
plot(PosNonLinSquarePD); hold on;
plot(PosNonLinSquarePID); hold on;
xlabel('Time')
ylabel('Reponse')
title('Linear Model using Sawtooth Pulse')
