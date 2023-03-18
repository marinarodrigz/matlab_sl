%% Desarrollo en serie de Fourier
% Intervalo temporal considerando T=1
t=0:0.001:4;
x=0.5; % Este es el valor para n=0
for n=1:2:7, % Consideramos 4 terminos impares
x = x + (2/(n*pi))*sin(2*n*pi.*t);
end
% Continuamos sumando para obtener la aproximación para n=8
y=x;
for n=9:2:15
y = y + (2/(n*pi))*sin(2*n*pi.*t);
end
% Continuamos sumando para obtener la aproximación para n=16
z=y;
for n=17:2:31
%Figura 2. Representación gráfica del módulo y fase de los coeficientes del
z = z + (2/(n*pi))*sin(2*n*pi.*t);
end
% Calculamos el tren de pulsos rectangulares usando la función ustep.m
% diseñada en la práctica 1. Para ello la función ustep.m debe estar en el
% mismo directorio desde donde se está llamando a dicha función
t1=1; t2=2;
f = zeros(size(t));
T = 1;
for k=0:6;
f = ustep(t-k*T) - ustep(t-(0.5+k*T)) + f;
end
% Trazamos las tres aproximaciones
figure;
grid on;
subplot(3,1,1), plot(t,x,'LineWidth',1);
hold on; % hold on permite que se represente en los mismos ejes la señal f.
plot(t,f,'r--','LineWidth',1)
ylim([-0.1 1.1])
ylabel('Aprox 4 terminos');
subplot(3,1,2), plot(t,y,'LineWidth',1);
hold on; % hold on permite que se represente en los mismos ejes la señal f.
plot(t,f,'r--','LineWidth',1)
ylim([-0.1 1.1])
ylabel('Aprox 8 terminos');
subplot(3,1,3), plot(t,z,'LineWidth',1);
hold on; % hold on permite que se represente en los mismos ejes la señal f.
plot(t,f,'r--','LineWidth',1)
ylim([-0.1 1.1])
ylabel('Aprox 16 terminos');
xlabel('t');