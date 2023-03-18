% Ejemplo 1.3
Fs = 1000;
dt = 1/Fs;
t = -10:dt:10;%0.001

% Gráfica de la señal x1(t)
x1 = 3*cos(2*t+1);
figure;
subplot(221)
plot(t,x1,'LineWidth',2);
grid on;
xlabel('t')
ylabel('x_1(t)')
title ('función x_1(x)')
f1 = 1/pi;
T1 =1/f1;
title(['x_1(t), T_1 = ' num2str(T1)])
line([T1 T1],[-3 3],'Color','r','LineWidth',2) %Línea roja en t=T1

% Gráfica de la señal x2(t)
x2 = 10*sin(pi*t);
subplot(222)
plot(t,x2,'LineWidth',2);
grid on;
xlabel('t')
ylabel('x_2(t)')
title ('función x_2(x)')
f2 = 1/2;
T2 =1/f2;
title(['x_1(t), T_2 = ' num2str(T2)])
line([T2 T2],[-10 10],'Color','r','LineWidth',2) %Línea roja en t=T2

% Gráfica de la señal x3(t)
x3 = 2*sin(3*t+4*pi);
subplot(223)
plot(t,x3,'LineWidth',2);
grid on;
xlabel('t')
ylabel('x_2(t)')
title ('función x_2(x)')
f3 = 2*pi/3;
T3 =1/f3;
title(['x_3(t), T_3 = ' num2str(T3)])%la barra baja es para el subindice
line([T3 T3],[-2 2],'Color','r','LineWidth',2) %Línea roja en t=T3

% Gráfica de la señal x4(t)
x4 = 3*sin((pi/2)*t+4)+5*cos(pi*t);

subplot(224)
plot(t,x4,'LineWidth',2);
grid on;
xlabel('t')
ylabel('x_4(t)')
title ('función x_4(x)')
f4 = 1/4;
T4 =1/f4;
title(['x_4(t), T_4 = ' num2str(T4)])
line([T4 T4],[-10 10],'Color','r','LineWidth',2) %Línea roja en t=T4


figure;
subplot(221)
plot(t,x1+x2,'LineWidth',2);
grid on;
xlabel('t')
ylabel('x(t)')
title ('función x1+x2')

subplot(222)
plot(t,x2+x3,'LineWidth',2);
grid on;
xlabel('t')
ylabel('x(t)')
title ('función x2+x3')

subplot(223)
plot(t,x2+x4,'LineWidth',2);
T7=lcm(T2,T4)
line([T7 T7],[-15 15],'Color','r','LineWidth',2)
grid on;
xlabel('t')
ylabel('x(t)')
title ('función x2+x4')


w=T1/T2
v=T2/T3
u=T2/T4

%verificar si un numero es racional
[N,D]=rat(v)
R=N/D
if R==v
    disp('Es racional')
else disp('no es racional')
end


