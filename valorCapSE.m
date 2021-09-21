function [MEx, MEy] = valorCapSE(X, Y, rx, ry, domt, m, sigma, puntox, puntoy)

%Variables iniciales
n = length(X);
delt = (domt(2)-domt(1))/(m-1);
MEx = zeros(n); MEy = zeros(n);

%Cálculo de las posiciones de la carga en la línea
for i=1:m
   qx(i)= double(rx(domt(1)+((i-1)*delt)));
   qy(i)= double(ry(domt(1)+((i-1)*delt))); 
end
lx = rx(domt(1)+delt)-rx(domt(1));
ly = ry(domt(1)+delt)-ry(domt(1));
difl = double(sqrt(lx^2+ly^2));
q = sigma*difl;

%Cálculo del campo en cada punto
if (puntox == 0) && (puntoy == 0)
for i=1:n
    for j=1:n
        sumx = 0; sumy = 0;
        for cq=1:m
            [Eqx, Eqy] = CoulombSE(q, qx(cq),qy(cq), X(i,j), Y(i,j));
            sumx = sumx + double(Eqx);
            sumy = sumy + double(Eqy);
        end
        MEx(i,j) = sumx;
        MEy(i,j) = sumy;
    end
end

%Cálculo del campo en un punto (coordenada)
else 
        sumx = 0; sumy = 0;
        for cq=1:m
            [Eqx, Eqy] = CoulombSE(q, qx(cq),qy(cq), puntox, puntoy);
            sumx = sumx + double(Eqx);
            sumy = sumy + double(Eqy);
        end
        MEx = sumx;
        MEy = sumy;
end
end