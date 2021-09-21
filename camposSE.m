function [X, Y] = camposSE(n,dominio)

%Definición de vectores vacíos
X = [];
Y = [];

%Creación de valores numéricos de los puntos
len = linspace(dominio(1,1),dominio(1,2),n);

%Creación de la malla de valores (en X)
for j=1:n
    k=1;
    for i = 1:n
    X(j,k)= len(i);
    k=k+1;
    end
end

%Creación de la malla de valores (en Y)
Y = flipud(X');
end