Fs = 1e4; % Frecuencia de muestreo
dt = 1/Fs; % Periodo de muestreo (tamaño de paso del vector discreto de tiempos)
t = -6:dt:6;

fpar=(senal_x(t)+senal_x(-t))/2;
fimpar=(senal_x(t)-senal_x(-t))/2;
suma=fpar+fimpar;

figure;
subplot(221);
plot(t,fpar,'linewidth',3);
grid on;
xlabel('t')
ylabel('Amplitud')
title('Función par')

subplot(222);
plot(t,fimpar,'linewidth',3);
grid on;
xlabel('t')
ylabel('Amplitud')
title('Función impar')

subplot(223);
plot(t,suma,'linewidth',3);
grid on;
xlabel('t')
ylabel('Amplitud')
title('Función suma')