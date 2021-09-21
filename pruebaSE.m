%Borrar las variables y limpiar el espacio de trabajo
clear; clc; clf; close all;

%Dominio de la malla
dominio = [-2.5,2.5,-2.5,2.5];

% Resolución de la malla
n = 15;

%Creación de malla de puntos
[X,Y] = camposSE(n,dominio);

%Definir las variables simbólica
syms Ex Ey x y

%Definición del campo vectorial
Ex(x,y) = (1/(x^2+y^2)*(3/2))*(x);
Ey(x,y) = (1/(x^2+y^2)*(3/2))*(y);

%Creación del campo vectorial (eléctrico)
[u,v] = direccionSE(X,Y,Ex,Ey);

hold on

%Envío de variable a graficación
GraficacionSE(X,Y,u,v,2)

%Creación y graficación de rectángulos
rectanguloSE(dominio, u)

hold off