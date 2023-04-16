clear all; % limpiamos la memoria del sistema de variables
close all; % cerramos todas las figuras
clc; % limpiamos la ventana de comandos
% cargamos datos
[xx,fs] = audioread('./test_1.wav');
% nos devuelve:
% fs es la frecuencia de muestreo (muestras/segundo) con la que se ha grabado la señal
% xx son los datos que contiene la señal de sonido
% construimos el vector de tiempo en segundos. El vector de tiempos va desde 1 hasta la
% longitud que tenga la señal xx, y el paso es 1/fs, es decir, cada 1/fs segundos tomamos
% una muestra de una señal continua en tiempo, y así la convertimos en una señal discreta
% en tiempo
tt = (1:length(xx))'/fs;
%representamos los datos en el dominio del tiempo
figure(1)
plot(tt,xx)
title('Archivo Brainville_1.wav');
xlabel('tiempo (s)');

yy=(abs(xx)>1.5*10^-4).*xx;
figure(2)
plot(tt,yy)


clic=xx(21.0778*fs:21.0798*fs);
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

%%PDS (calcular rango de frecuencia)
figure(5);
PDS=Y(1:NFFT/2+1,1).*conj(Y(1:NFFT/2+1,1));
plot(freq,PDS)


%Fragmento de audio usado para el estudio de ICI y ancho del clic
    
    m1 = 7.05e6;
    m2 = 7.35e6;
    
    figure;
    plot(y(m1:m2));
    title('Fragmento usado para el estudio');
    grid on;
    
    %ICI
    
    %Se ha ampliado un fragmento del audio en función del tiempo. A partir 
    %de él sacamos manualmente la distancia tempora entre clics
    
    ICI = mean(diff([74.09 74.2 74.7 74.9 75.25 75.45]));
    fprintf('ICI = %f s\n',ICI); 
    
    
    load sunspot.dat

year = sunspot(:,1);
avSpots = sunspot(:,2);

findpeaks(avSpots,year,'MinPeakDistance',6)
[pks,locs] = findpeaks(avSpots,year,'MinPeakDistance',6);

meanCycle = mean(diff(locs))
