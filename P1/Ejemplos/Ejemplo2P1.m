% Grafica de la señal x(t)
figure;
subplot(221);
plot(t,x,'LineWidth',3);
grid on;
xlim([t(1) t(end)])
xlabel('t')
ylabel('x(t)')
title('x(t)')
% Grafica de la señal x(-t)
nt=-t;
subplot(222)
plot(nt,x,'LineWidth',3);
grid on;
xlim([t(1) t(end)])
xlabel('t')
ylabel('x(-t)')
title('x(-t)')
% Grafica de la señal x(2-t)
ct=2-t;
subplot(223)
plot(ct,x,'LineWidth',3);
grid on;
xlabel('t')
ylabel('x(2-t)')
title('x(2-t)')
% Grafica de la señal x(t/2)
et=t*2;%ensanchar vector tiempo
subplot(224)
plot(et,x,'LineWidth',3);
grid on;
xlim([t(1) t(end)])
xlabel('t')
ylabel('x(t/2)')
title('x(t/2)')



