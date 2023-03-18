Fs = 1000; 
dt = 1/Fs; 
t = -10:dt:10; 
figure;
%gráfica impulso unitario
subplot(221)
plot(t,ustep(t),"LineWidth",3);
grid on;
title('Escalón unitario, u(t)')
xlabel('t')
ylim([0 1.1])
xlim([-5 5])
%gráfica señal impulso
subplot(222)
plot(t,delta(t),'LineWidth',3);
grid on;
title('Señal impulso, δ(t)')
xlabel('t')
ylim([0 1.1])
xlim([-5 5])
%gráfica señal rampa
subplot(223)
plot(t,rampa(t),'LineWidth',3);
grid on;
title('Señal rampa, rampa(t)')
xlabel('t')
ylim([0 5])
xlim([-5 5])
%gráfica señal rectangular
t1 = -1; t2 = 1;
y = ustep(t-t1) - ustep(t-t2);
subplot(224)
stairs(t,y,'LineWidth',3);
grid on;
title('Señal rectangular, u(t)')
xlabel('t')
ylim([0 1.1])
xlim([-5 5])


