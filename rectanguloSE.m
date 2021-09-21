function rectanguloSE(dominio, u)

%Definición de parámetros locales
x1 = dominio(1,1);
x2 = dominio(1,2);
y1 = dominio(1,3);
y2 = dominio(1,4);

%Ancho y alto de los rectángulos
ancho = 0.5;
alto = length(y1:y2);

%Definición de los rectángulos por cada situación
if u(1) < 0
    if u(end) < 0
    rectangle("Position", [x1-1,y1,ancho,alto-1], 'FaceColor',[0 0 1]);
    rectangle("Position", [x2+(0.3),y1,ancho,alto-1], 'FaceColor',[1 0 0]);
    else
    rectangle("Position", [x1-1,y1,ancho,alto-1], 'FaceColor',[0 0 1]);
    rectangle("Position", [x2+ancho,y1,ancho,alto-1], 'FaceColor',[0 0 1]);
    end
  
elseif u(1) == 0
    rectangle("Position", [x1-1,y1,ancho,alto-1]);
    rectangle("Position", [x2+ancho,y1,ancho,alto-1]);
    
elseif u(1) > 0
    if u(end) > 0
    rectangle("Position", [x1-(ancho+0.3),y1,ancho,alto-1], 'FaceColor',[1 0 0]);
    rectangle("Position", [x2+ancho,y1,ancho,alto-1], 'FaceColor',[0 0 1]); 
    else
    rectangle("Position", [x1-(ancho+0.3),y1,ancho,alto-1], 'FaceColor',[1 0 0]);
    rectangle("Position", [x2+ancho,y1,ancho,alto-1], 'FaceColor',[1 0 0]); 
    end
end
end