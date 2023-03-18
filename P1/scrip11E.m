%%Apartado 1.1.E
Fs = 1e4; % Frecuencia de muestreo
dt = 1/Fs; % Periodo de muestreo (tamaño de paso del vector discreto de tiempos)
t = -6:dt:6;
nt = -t
%función 1
figure;
subplot(221);
plot(nt,senal_x(t),'LineWidth',3); %No olvidar meter parámetro
grid on;
xlim([-3 3])
xlabel('t')
ylabel('x(-t)')
title('x(-t)')
%figura 2
ct= 2-t
%figure;SOLO SE PONE AL PRINCIPIO SI NO TE CREA VARIAS GRAFICAS
subplot(222);
plot(ct,senal_x(t),'LineWidth',3); 
grid on;
xlim([-3 3])
xlabel('t')
ylabel('x(2-t)')
title('x(2-t)')
%figura 3
dt = t/2;
subplot(223);
plot(dt,senal_x(t),'LineWidth',3); 
grid on;
xlim([-3 3])
xlabel('t')
ylabel('x(2t)')
title('x(2t)')

