%Borrar las variables y limpiar el espacio de trabajo
clear; clc; clf; close all;

%Definir las variables simbólica
syms r t rx ry rx2 ry2

%Definir variables iniciales
puntox = 0; puntoy = 0;

% Resolución de la malla
n = 30;

%Dominio de la malla
dominio = [-15,15,-15,15];

% Posición y longitud de las líneas
a=5; lon = 10; lon2 = 5;

%Parametrización de líneas
rx(t)= -a; ry(t)=t;
rx2(t)= a; ry2(t)=t;
domt=[-lon/2, lon/2];
domt2=[-lon2/2, lon2/2];

%Resolución de la línea
m = 100;
sigma = 20; %Carga 1
sigma2 = -20; %Carga 2

%Creación de malla de puntos
[X,Y] = camposSE(n,dominio);

%Creación del campo eléctrico
[MEx, MEy] = valorCapSE(X, Y, rx, ry, domt, m, sigma, puntox, puntoy);
[MEx2, MEy2] = valorCapSE(X, Y, rx2, ry2, domt2, m, sigma2, puntox, puntoy);

%Envío de variable a graficación
GraficacionSE(X,Y,MEx+MEx2, MEy+MEy2, 1)

%Graficación de líneas
hold on
fplot(rx, ry, [-5, 5])
fplot(rx2, ry2, [-2.5, 2.5])

%Creación y graficación de rectángulos
if sigma >= 1
    if sigma2 >= 1
    rectangle("Position", [-a-0.5 domt(1),1,lon], 'FaceColor',[1 0 0], 'EdgeColor', [1 0 0]);
    rectangle("Position", [a domt2(1),1,lon2], 'FaceColor',[1 0 0], 'EdgeColor', [1 0 0]);
    else
    rectangle("Position", [-a-0.5 domt(1),1,lon], 'FaceColor',[1 0 0], 'EdgeColor', [1 0 0]);
    rectangle("Position", [a domt2(1),1,lon2], 'FaceColor',[0 0 1], 'EdgeColor', [0 0 1]);
    end
elseif sigma <= 1
    if sigma2 <= 1
    rectangle("Position", [-a-0.5 domt(1),1,lon], 'FaceColor',[0 0 1], 'EdgeColor', [0 0 1]);
    rectangle("Position", [a domt2(1),1,lon2], 'FaceColor',[0 0 1], 'EdgeColor', [0 0 1]);
    else
    rectangle("Position", [-a-0.5 domt(1),1,lon], 'FaceColor',[0 0 1], 'EdgeColor', [0 0 1]);
    rectangle("Position", [a domt2(1),1,lon2], 'FaceColor',[1 0 0], 'EdgeColor', [1 0 0]);     
    end
else
end

%Campo eléctrico de un punto
i = 0;

while i == 0
[puntox, puntoy] = ginput(1);

[MEx, MEy] = valorCapSE(X, Y, rx, ry, domt, m, sigma, puntox, puntoy);
[MEx2, MEy2] = valorCapSE(X, Y, rx2, ry2, domt2, m, sigma2, puntox, puntoy);

MExpunto = MEx + MEx2;
MEypunto = MEy + MEy2;

hold on;
txt1 = sprintf('%g', MExpunto);
txt2 = sprintf('%g', MEypunto);

dim = [0.15 0.15 0.15 0.1];
str1 = ['Ex: ', txt1];
str2 = ['Ey: ', txt2];
str = {str1,str2};

annotation('textbox',dim,'String',str,'FitBoxToText','on', 'BackgroundColor', [1 1 1]);
if (puntox > dominio(1,2)) || (puntox < dominio(1,1))
    i = 1;
else
end
end