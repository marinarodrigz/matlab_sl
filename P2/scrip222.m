%% Desarrollo en serie de Fourier
% Intervalo temporal considerando T=7
t=-10:0.001:10;
x=0; % Este es el valor para n=0
for n=1:4, % Consideramos 4 terminos 
x = x + (-2/(n*pi))*sin((2/7)*n*pi.*t);
end
% Continuamos sumando para obtener la aproximación para n=8
y=x;
for n=5:10;
y = y + (-2/(n*pi))*sin((2/7)*n*pi.*t);% empezar en el siguiente
end
% Continuamos sumando para obtener la aproximación para n=16
z=y;
for n=11:14;
%Figura 2. Representación gráfica del módulo y fase de los coeficientes del
z = z + (-2/(n*pi))*sin((2/7)*n*pi.*t);
end
% Calculamos el tren de pulsos rectangulares usando la función ustep.m
% diseñada en la práctica 1. Para ello la función ustep.m debe estar en el
% mismo directorio desde donde se está llamando a dicha función
f = zeros(size(t));%no olvidar definir ceros
T = 7;
for k=-10:10;
f =signalp2(t+k*T)+f;
end
% Trazamos las tres aproximaciones
figure;
grid on;
subplot(3,1,1), plot(t,x,'LineWidth',1);
hold on; % hold on permite que se represente en los mismos ejes la señal f.
plot(t,f,'r--','LineWidth',1) 
ylim([-1.5 1.5])
xlim([-10 10])
ylabel('Aprox 4 terminos');
subplot(3,1,2), plot(t,y,'LineWidth',1);
hold on; % hold on permite que se represente en los mismos ejes la señal f.
plot(t,f,'r--','LineWidth',1)
ylim([-1.5 1.5])
xlim([-10 10])
ylabel('Aprox 10 terminos');
subplot(3,1,3), plot(t,z,'LineWidth',1);
hold on; % hold on permite que se represente en los mismos ejes la señal f.
plot(t,f,'r--','LineWidth',1)
ylim([-1.5 1.5])
xlim([-10 10])
ylabel('Aprox 14 terminos');
xlabel('t');