%% BORRAMOS DATOS ANTERIORES
clc;
clear all;
close all;

%% CARGAMOS EL MODELO DISCRETO %
Tm = 10;
run Mod.m


%% CONTROLADOR REGULADOR CON OBSERVADOR

%condicion de controlabilidad
n=rank(ctrb(Ad,Bd));
%ubicamos los polos de acorde con las especificaciones
polos=0;
%calculamos K por el metodo de Ackerman
K=[0 0 1]*ctrb(Ad,Bd)^(-1)*(Ad^3)
%condicion de observabilidad
m=rank(obsv(Ad,Cd));
%calculamos K por el metodo de Ackerman
Ke=(Ad^3)*obsv(Ad,Cd)^(-1)*[0; 0; 1]

%% COMPROBACIÓN
tsim = 500;
mex('ComputadoraSS.c');
sim('sk_DepositosSS');

% PLOTEAR RESULTADOS 
subplot (3,1,1:2);
plot (t,X); grid;
legend ('H1','H2','H3');
ylabel('Alturas (m)');
xlabel('Tiempo (s)');
subplot (3,1,3);
plot (t,Qc); grid;
legend ('Qc0');
ylabel('Caudal de entrada (m^3/s)');
xlabel('Tiempo(s)');