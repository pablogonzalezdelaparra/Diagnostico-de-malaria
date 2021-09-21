function [un,vn] = direccionSE(X,Y,Ex,Ey)

%Definición de vectores vacíos
un = [];
vn = [];

%Creación de los campos vectoriales (en X y Y)
for j = 1:size(X)
    k = 1;
    for i = 1:size(X)
        try
        numbx = double(Ex(X(j,k),Y(j,k)));
        numby = double(Ey(X(j,k),Y(j,k)));
        catch
        numbx = double(0);
        numby = double(0);
        end
        un(j,k)= numbx;
        vn(j,k)= numby;
        k = k + 1;
    end
end 
end