%% Apartado 1.1.2
Fs = 1e4; % Frecuencia de muestreo
dt = 1/Fs; % Periodo de muestreo (tamaño de paso del vector discreto de tiempos)
t = -3:dt:3;
figure;
subplot(221);
plot(t,senal_x(t),'LineWidth',3); %No olvidar meter parámetro
grid on;
xlim([t(1) t(end)])
xlabel('t')
ylabel('x(t)')
title('x(t)')




