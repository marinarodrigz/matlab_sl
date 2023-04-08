%doc audioread % Ayuda sobre la función audioread
%[y,Fs] = audioread(filename);
% audioread: Lee los datos del fichero de nombre filename. La salida son las muestras y
% del fichero de audio y su frecuencia de muestreo Fs.

%doc fft % Ayuda sobre la función fft
%Y = fft(y,NFFT);
% fft: calcula la transformada de Fourier discreta de la señal y en NFFT frecuencias discretas.
% La salida Y es un vector de longitud NFFT la transformada discreta de Fourier y
% tiene longitud NFFT

%%
close all; clear all; clc;
filename = 'EbClarinet.ff.stereo.aif'; % Nombre del fichero de audio analizar
[y,Fs] = audioread(filename); % Abrimos el audio y lo cargamos en el vector de nombre y
% Fs es la frecuencia de muestreo
dt = 1/Fs; % dt es el periodo de muestreo
muestra_inicial = 10 ; % Muestra inicial es el número de muestra
% En este ejemplo se elige 24113 porque el sonido del piano no comienza en el
% archivo de audio exactamente en t=0 sino aproximadamente a partir de la muestra
% 24113
y = y(muestra_inicial:end,:);
L = length(y); % L es la longitud del vector de datos y
t = [0:1:L-1]'*dt; % t es un vector de tiempos con mismo tamaño que y
figure; % Representación gráfica de la señal y en función del tiempo, t
subplot(211)
plot(t,y(:,1),'Color',[210 140 83]/255)
title('Canal L')
ylabel('amplitud')
xlabel('tiempo (s)')
ylim([-0.4 0.4])
xlim([0 10])
grid on;
subplot(212)
plot(t,y(:,2),'Color',[210 140 83]/255)  %Esta señal de audio es una señal estéreo, 
% lo que significa que contiene información de dos canales de audio diferentes: el canal izquierdo (L) y el canal derecho (R).
%Para acceder a los datos de un solo canal en la señal de audio, se utiliza la notación de índice ':,' 
% para seleccionar todas las filas de una columna específica. 
% Por lo tanto, el vector y(:,1) selecciona todas las filas de la primera columna de y, que contiene los datos del canal izquierdo.
% el numerajo ese es el color
title('Canal R')
ylabel('amplitud')
xlabel('tiempo (s)')
ylim([-0.4 0.4])
xlim([0 10])
grid on


%% Determinación armónicos
NFFT = 2^nextpow2(L); % Siguiente número potencia de 2 de la longitud de y.
Y = fft(y,NFFT)/L; % Estimación transformada rápida discreta de Fourier
freq = Fs/2*linspace(0,1,NFFT/2+1); % Vector de frecuencias de longitud NFFT
% e intervalo [0 Fs/2]
% Representación gráfica del espectro de la señal.
figure;
semilogy(freq,2*abs(Y(1:NFFT/2+1,1)),'Color',[210 140 83]/255)
title('Espectro de amplitud de y(t)')
xlabel('Frequencia (Hz)')
ylabel('|Y(f)|')
xlim([0 Fs/2])
grid on;

%% Cálculo envolvente señal.
[pks,locs] = findpeaks(y(:,1),'MinPeakDistance',round(Fs*0.9/f0));
yupper = interp1(locs/Fs,pks,t,'spline');
[pks,locs] = findpeaks(-y(:,1),'MinPeakDistance',round(Fs*0.9/f0));
ylower = interp1(locs/Fs,-pks,t,'spline');
figure;
plot(t,y(:,1),'Color',[210 140 83]/255)
hold on;
plot(t,yupper,'k')
plot(t,ylower,'k')
ylabel('amplitud')
xlabel('tiempo (s)')
%xlim([0 t(end)])
xlim([0 1.5])
grid on%%
y_sinth_env = y_sinth.*yupper; % Señal sintetizada con variación de amplitud
figure;
plot(t,y_sinth_env,'Color',[210 140 83]/255)
grid on;%%
duracion = [1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0]; % Duración en segundos de cada nota
n = duracion.*Fs; % Longitud en muestras de cada nota
nota_ref = 65.4064; % Nota de referencia (en este caso elegimos la frecuencia de un DO2, 65,4064 Hz).
f0 = nota_ref*[1 2^(2/12) 2^(4/12) 2^(5/12) 2^(7/12) 2^(9/12) 2^(11/12) 2];
% Frecuencia fundamental de cada señal generada. En este ejemplo vamos a generar
% 8 señales de audio con frecuencia fundamental igual a las componentes del vector f0

%%
bn = 1/2.17e-3*[2.17e-3 1.43e-3 2.5e-4 5e-4 5.14e-4 9.17e-5 18e-5 6.38e-5 ...
6.12e-5 3.16e-5 2.56e-5 1.59e-5 1.697e-5 1.534e-5 1.821e-5 1.054e-5 3.22e-6 ...
4.43e-6 4.56e-6 4.6e-6 4.7e-6 6.4e-7 2.5e-6];
% bn son los coeficientes del desarrollo en serie de Fourier (en este caso son
% los mismos que ya fueron estimados anteriormente)
ys = []; % ys será la señal final de duración sum(duración) = 8 segundos
% formada por las 8 notas de la escala mayor de DO2
for j = 1:length(f0)
t = 0:dt:duracion(j)-dt;
f = f0(j)*[1:length(bn)];
y_sinth = zeros(size(t(j)));
for i=1:length(f)
y_sinth = bn(i).*sin(2*pi*f(i).*t) + y_sinth; % Suma serie de Fourier
end
n = duracion.*Fs;
y_sinth_env = y_sinth.*yupper(1:length(y_sinth),1)';
% yupper es la envolvente superior que fue calculada anteriormente
ys = cat(2,ys,y_sinth_env/max(y_sinth_env(:)));
% El comando cat concatena los vectores y_sinth_env generados
end
%%
t = 0:dt:sum(duracion)-dt;
figure; % Representación gráfica de la señal y en función del tiempo, t
plot(t,ys,'Color',[210 140 83]/255)
title('Señal de audio')
ylabel('amplitud')
xlabel('tiempo (s)')
ylim([-1 +1])
grid on;
sound(ys,Fs)
% Si se desea dejar de reproducir el sonido se puede escribir en la ventana
% de comandos la instrucción clear sound
audiowrite('sintetizador_escala_DO2.wav',ys,Fs)
% Este comando crea un fichero de audio en formato wav, que puede ser
% reproducido en cualquier programa externo de audio. Recuerde que las
% amplitudes del vector de datos con el que se construye el fichero de
% audio debe estar en el intervalo [-1,+1].