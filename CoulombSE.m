function [Eqx, Eqy] = CoulombSE(q,qx,qy,X,Y)

%Cálculo de la carga en cada punto
k = 9*10^9;
x = X-qx; y = Y-qy;
Eqx = k*q*x/(x^2+y^2)^(3/2);
Eqy = k*q*y/(x^2+y^2)^(3/2);
end