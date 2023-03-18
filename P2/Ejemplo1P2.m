%% Ejemplo 2.1

% El siguiente comando calcula y almacena la expresión compleja
z1=(2+1i)/(1-1i)+(1+1i)/(2-1i);

% El modulo se puede obtener en la forma
modulo1=abs(z1)

% Y la fase en la forma
fase1=angle(z1)

% Y las partes real e imaginaria en la forma
preal1=real(z1)
pimag1=imag(z1)

%{
Nótese que MatLab también permite usar tanto 'j' como 'i' para representar a
la unidad imaginaria o sqrt(-1). Sin embargo, es aconsejable el uso de '1i' o
'1j' porque el cálculo es más rápido y permite seguir usando, si se desea,
variables de nombre 'i' y 'j'.

El modulo se puede obtener también a partir de los valores de la parte real
e imaginaria de z1, del siguiente modo:
%}

modulo2=sqrt(preal1^2+pimag1^2) %sqrt(x) raíz cuadrada
fase2=atan2(pimag1,preal1) % atan2 arctan de 4 cuadrantes