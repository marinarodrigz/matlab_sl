%% Representación de los coeficientes del desarrollo en serie compleja de
%% Fourier
N = 10; % Número de términos del desarrollo en serie;
% Si N = 10, obtenemos los valores de cn para -10<=n<=10
n=-N:1:N;
cn=(cos(n*pi)-1)./(-2*j*n*pi);
%{
Nótese el uso del operador ./ en lugar de / es necesario
para especificar un cociente de vectores componente a componente.
Es necesario ajustar el valor de cn para n=0 por la existencia de la
indeterminación.
Para ello nos hace falta identificar la posición o índice (index) del vector n
donde el valor n(index) vale cero.
Esto se puede realizar mediante el comando find, que busca dentro de un vector
en qué posición se cumple una condición dada.
%}
index = find(n==0);
cn(index)=0.5;
% Ahora ya se puede trazar el espectro discreto de la función
% Modulo
figure;
subplot(2,1,1), stem(n,abs(cn));
xlabel('n');
ylabel('Modulo de c_n');
grid on;
% Fase
subplot(2,1,2), stem(n,angle(cn)); %stem representación valores discretos
xlabel('n');
ylabel('Fase c_n');
grid on;
% Nótese que los armónicos pares son cero excepto el n=0
% que corresponde al valor promedio de la función v(n)
