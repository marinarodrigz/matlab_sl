function [valor_muestra_deseada] = yclic (tiempo_deseado, audio, fs)
    muestra_deseada = round(tiempo_deseado * fs);
    valor_muestra_deseada = audio(muestra_deseada);
end