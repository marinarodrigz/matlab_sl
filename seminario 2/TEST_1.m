%% FUNCIÓN DEL TIEMPO

clear all; % limpiamos la memoria del sistema de variables
close all; % cerramos todas las figuras
clc; % limpiamos la ventana de comandos
% cargamos datos
[xx,fs] = audioread('./test_1.WAV');
% nos devuelve:
% fs es la frecuencia de muestreo (muestras/segundo) con la que se ha grabado la señal
% xx son los datos que contiene la señal de sonido
% construimos el vector de tiempo en segundos. El vector de tiempos va desde 1 hasta la
% longitud que tenga la señal xx, y el paso es 1/fs, es decir, cada 1/fs segundos tomamos
% una muestra de una señal continua en tiempo, y así la convertimos en una señal discreta
% en tiempo
tt = (1:length(xx))'/fs; %(97.290*fs:97.293*fs)
%representamos los datos en el dominio del tiempo
figure(1)
plot(tt,xx)
title('TEST_1.wav');
xlabel('tiempo (s)');


%% QUITAR RUIDO
yy=(abs(xx)>2*10^-3).*xx;
figure(2)
plot(tt,yy)

%% TRANSFORMADA

clic=xx(38.809*fs:38.81*fs);
figure;
plot(clic);
title('Clic de la señal original xx(t)');
% Obtenemos el espectro de la señal sin ruido.
L=length(clic);
NFFT = 2^nextpow2(L); % Siguiente número potencia de 2 de la longitud de yy.
Y = fft(clic,NFFT)/L; % Estimación transformada rápida discreta de Fourier
freq = fs/2*linspace(0,1,NFFT/2+1); % Vector de frecuencias de longitud NFFT
% en el intervalo [0 Fs/2]

% Representación gráfica del espectro de la señal.
figure(4);
semilogy(freq,2*abs(Y(1:NFFT/2+1,1))/max(2*abs(Y(:))),'Color',[210 140 83]/255)
title('Espectro de amplitud de un clic');
xlabel('Frequencia (Hz)')
ylabel('|Y(f)|_{normalizado}')

%% CÁLCULO DE PSD DENSIDAD ESPECTRAL DE POTENCIA PARA HALLAR EL RANGO DE FRECUENCIA
figure(5)
PSD=Y(1:NFFT/2+1,1).*conj(Y(1:NFFT/2+1,1));
plot(freq, PSD)
% Encontramos el pico más alto de la gráfica
[y_max, idx] = max(PSD);
x_max = freq(idx);
disp(['La frecuencia de la señal es ', num2str(x_max),+'Hz'])

%% FINDPEAKS

%{
 locs es un vector que contiene los tiempos en segundos en los que se 
 encuentran los máximos locales (clics) en la señal de sonido
 (0.2 es separación mínima entre clics)
 %}

[pks,locs]=findpeaks(xx, tt,'MinPeakDistance',0.2);  

%Representación picos
figure(6)
plot(tt,yy,'b',locs,pks,'or');
xlabel('tiempo (s)');
ylabel('Amplitud');
title('Picos detectados con la función findpeaks');

% La función "diff" toma la diferencia entre cada elemento consecutivo
% del vector "locs" para calcular los intervalos de clics    
IntervaloICI = diff(locs);
% calcula la media de los intervalos interclics
ICI = mean(IntervaloICI);

fprintf('La distancia temporal promedio entre picos es %f s\n', ICI);

%% CALCULAR LONGITUD CLIC
media = longitudClic (locs,50, 135, 25, 271, 100, yy, fs);
fprintf('La longitud media de los clicks es %f s\n', media);

