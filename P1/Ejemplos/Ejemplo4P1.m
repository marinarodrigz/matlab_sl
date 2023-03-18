%% Ejemplo 1.3
Fs = 1000; % Frecuencia de muestreo
dt = 1/Fs; % Periodo de muestreo
t = -10:dt:10; % Vector de tiempos
% Gráfica de la señal escalón unitario
u = zeros(size(t));
for i=1:length(t)
if t(i)>=0
u(i) = 1;
end
end
subplot(131);
plot (t,u);
grid on;
ylim([0 1.1])
xlim([-5 5])
title('Escalón unitario, u(t)')
xlabel('t')
% Gráfica de la señal impulso unitario
d = zeros(size(t));
for i=1:length(t)
if t(i)==0
d(i) = 1;
end
end
subplot(132)
plot(t,d)
grid on;
ylim([0 1.1])
xlim([-5 5])
title('impulso unitario, \delta(t)')
xlabel('t')
% Gráfica de la señal rampa
r = zeros(size(t));
for i=1:length(t)
if t(i)>0
r(i) = t(i);
end
end
subplot(133)
plot(t,r)
grid on;
ylim([0 5])

xlim([-5 5])
title('señal rampa, r(t)')
xlabel('t')