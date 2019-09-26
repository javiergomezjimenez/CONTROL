%% BORRAMOS DATOS ANTERIORES
clc;
clear all;
close all;

%% CARGAMOS EL MODELO DISCRETO %
Tm = 10;
run Mod.m


%% CONTROLADOR DE SEGUIMIENTO

% Condición de controlabilidad
n=rank(ctrb(Ad,Bd))
% Ubicamos los polos de acorde con las especificaciones
polos=0;
% Calculamos K por el metodo de Ackerman
K=[0 0 1]*ctrb(Ad,Bd)^(-1)*(Ad^3);
% Calculamos K0 para la referencia
K0 = (Cd*(eye(3)-Ad+Bd*K)^(-1)*Bd)^(-1)

%% Comprobamos:
tsim = 600;
mex('ComputadoraSS.c');
sim('sk_DepositosSS');

% PLOTEAR RESULTADOS 
subplot (3,1,1:2);
plot (t,X,t,Ref,'k'); grid;
legend ('H1','H2','H3','Ref');
ylabel('Alturas (m)');
xlabel('Tiempo (s)');
subplot (3,1,3);
plot (t,Qc); grid;
legend ('Qc0');
ylabel('Caudal de entrada (m^3/s)');
xlabel('Tiempo(s)');