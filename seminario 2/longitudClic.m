%{ 
locs: Vector con los valores en segundos de los picos
muestra: Número de picos a analizar
longitud_izq: Distancia desde la que se empieza a medir la amplitud
              de la señal desde el pico del clic a la izquierda
              (debería ser igual a la mitad de la longitud del clic)
paso: Distancia a aumentar por iteración

Función: Ponemos una posición "x_inicial" para comenzar a medir,
y vamos incrementando "paso" el valor de la posición.
El primer valor se toma cuando el valor de la y es distinta de 0
El último valor se toma si el valor anterior es 0 y el actual también
%}
function [ media ] = longitudClic (locs, muestra, longitud_izq, paso, valor_max, valor_min, grafica ,fs)
    
    % Variable para almacenar la media (será devuelta)
    media = 0;
    media_muestra = 0;

    % Recorre todos los clics
    for i=1:muestra
    
        % Pico del clic
        x = locs(i);
        
        % Valor para comenzar a medir
        x_inicio = x - longitud_izq * 10^-6;
    
        % Valor anterior (inicializado a true)
        valor_anterior = true;
    
        % 
        primer_valor = false;
        ultimo_valor = 0;
        fprintf("Midiendo pico " + num2str(i) + "\n");
    
        for j=1:100
            valor_y = yclic(x_inicio, grafica, fs);
            fprintf("Iteracion: "+num2str(j)+" Valor y: "+num2str(valor_y)+" X: "+num2str(x_inicio)+"\n");
    
            if primer_valor == false && valor_y ~= 0
                primer_valor = x_inicio;
            elseif valor_anterior == 0 && valor_y == 0 && primer_valor ~= false
                siguiente_pos = x_inicio + (100 * 10^-6) * (j+1) / 100;
                siguiente_valor = yclic(siguiente_pos, grafica, fs);
    
                if siguiente_valor == 0
                    ultimo_valor = x_inicio;
                    fprintf("Breaking...\n");
                    break;
                end
    
            end
    
            valor_anterior = valor_y;
            x_inicio = x_inicio + (paso * 10^-6) * j / 100;
        end
    
        valor = ultimo_valor - primer_valor;
        if valor < valor_max * 10^-6 && valor > valor_min * 10^-6
            fprintf("Valor del clic: "+num2str(valor)+"\n\n");
            media = media + valor;
            media_muestra = media_muestra + 1;
        end
    end
    
    % Divide la media por el número de picos
    media = media / media_muestra;
    disp(media); 
end