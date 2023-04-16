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
function [ media ] = longitudClic (locs, muestra, longitud_izq, paso, valor_max)
    
    % Variable para almacenar la media (será devuelta)
    media = 0;

    % Recorre todos los clics
    for i=1:muestra

        % Pico del clic
        x = locs(i);
        
        % Valor para comenzar a medir
        x_inicio = x - longitud_izq * 10^-6;

        % Valor anterior (inicializado a true)
        valor_anterior = true;

        % Inicializa "primer_valor" a false
        primer_valor = false;

        % Inicializa "ultimo_valor" a 0
        ultimo_valor = 0;

        fprintf("Midiendo pico " + num2str(i) + "\n");
    
        % Bucle para dividir clics en segmentos pequeños
        for j=1:100
            % Se asigna a "valor_y" el valor en el instante de tiempo "x_inicio"
            valor_y = yclic(x_inicio, yy, fs);

            fprintf("Iteracion: "+num2str(j)+" Valor y: "+num2str(valor_y)+"\n");

            % Comprueba que "primer_valor" no esté inicializazo y el valor actual
            % sea distinto de 0
            if primer_valor == false && valor_y ~= 0
                primer_valor = x_inicio;
            % Comprueba que "valor_anterior" sea 0 y que el valor actual también lo sea
            elseif valor_anterior == 0 && valor_y == 0
                % En caso de cumplirse, calcula el siguiente valor para comprobar
                % que ya no estemos dentro del clic
                siguiente_pos = x_inicio + (100 * 10^-6) * (j+1) / 100;
                siguiente_valor = yclic(siguiente_pos, yy, fs);

                % Si también es 0, se almacena el valor y se sale del bucle
                if siguiente_valor == 0
                    ultimo_valor = x_inicio;
                    fprintf("Breaking...\n");
                    break;
                end
    
            end

            % "valor_y" pasa a ser "valor_anterior" para la 
            % siguiente iteración, igual con "x_inicio", se
            % prepara para la siguiente iteración aumentando su valor
            valor_anterior = valor_y;
            x_inicio = x_inicio + (paso * 10^-6) * j / 100;
        end
        
        valor = (ultimo_valor - primer_valor);
        
        % Comprobación de que sea menor que el valor máximo admitido
        % para evitar grandes errores de medida
        if valor < valor_max
            % Se suma a la media la diferencia del último valor y el primero
            media = media + valor;
        end
    end
   
    % Divide la media por el número de picos
    media = media / muestra;
    
end