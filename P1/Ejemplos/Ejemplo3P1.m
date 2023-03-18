% Ejemplo 1.3
Fs = 1000;
dt = 1/Fs;
t = 0:dt:100;%0.001
% Gráfica de la señal x1(t)
x1 = 3/2*sin(t/2);
figure;
subplot(221)
plot(t,x1,'LineWidth',2);
grid on;
xlabel('t')
ylabel('x_1(t)')
f1 = 1/(2*pi);
T1 = 1/f1;
title(['x_1(t), T_1 = ' num2str(T1)])
line([T1 T1],[-2 2],'Color','r','LineWidth',2) %Línea roja en t=T1
ylim([-2 2])
xlim([0 14])
% Gráfica de la señal x2(t)
x2 = cos(pi/4*t + 2);
subplot(222)
plot(t,x2,'LineWidth',2);
grid on;
xlabel('t')
ylabel('x_2(t)')
f2 = 1/8;
T2 = 1/f2;
title(['x_2(t), T_2 = ' num2str(T2)])
line([T2 T2],[-2 2],'Color','r','LineWidth',2) %Línea roja en t=T2
ylim([-2 2])
xlim([0 14])
% Gráfica de la señal x3(t)
x3 = 2*cos(3*pi*t + 2);
subplot(223)
plot(t,x3,'LineWidth',2);
grid on;
xlabel('t')
ylabel('x_3(t)')
f3 = 3/2;
T3 = 1/f3;
title(['x_3(t), T_3 = ' num2str(T3)])
line([T3 T3],[-3 3],'Color','r','LineWidth',2) %Línea roja en t=T3
ylim([-3 3])
xlim([0 14])
% Gráfica de la señal x4(t)
x4 = 3*sin(2*pi*t) + 2*sin(pi*t);
subplot(224)
plot(t,x4,'LineWidth',2);
grid on;
xlabel('t')
ylabel('x_4(t)')
f4 = 1/2;
T4 = 1/f4;
title(['x_4(t), T_4 = ' num2str(T4)])
line([T4 T4],[-5 5],'Color','r','LineWidth',2) %Línea roja en t=T4
ylim([-5 5])
xlim([0 14])
