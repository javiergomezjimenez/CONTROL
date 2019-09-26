%% BORRAMOS DATOS ANTERIORES
clc;
clear all;
close all;

%% CARGAMOS EL MODELO DISCRETO %
Tm = 10;
run Mod.m


%% CONTROLADOR REGULADOR

%condicion de controlabilidad de los estados
n=rank(ctrb(Ad,Bd))
% Condición de controlabilidad de la salida
m=rank([Dd Cd*Bd Cd*Ad*Bd Cd*Ad^2*Bd])
%ubicamos los polos de acorde con las especificaciones
polos=0;
%calculamos K por el metodo de Ackerman
K=[0 0 1]*ctrb(Ad,Bd)^(-1)*(Ad^3);

%% COMPROBACIÓN
tsim = 500;
mex('ComputadoraSS.c');
sim('sk_Depositos');

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