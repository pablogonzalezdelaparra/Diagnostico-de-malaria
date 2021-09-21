function GraficacionSE(X,Y,u,v,n)

%Normalización de vectores
d = u./sqrt(u.^2+v.^2);
v = v./sqrt(u.^2+v.^2);

%Eliminación de valores NaN
d(isnan(d))=0;
v(isnan(v))=0;

%Creación del campo con flechas
quiver(X,Y,d,v, 'color', [0 0 1], 'AutoScale','on', 'AutoScaleFactor', 0.4);

%Definición de características por situaciones
if n == 1
title('Graficación de placas paralelas (Dielectroforesis)')
box on
else
title('Graficación de un campo vectorial eléctrico')    
box on
end
end