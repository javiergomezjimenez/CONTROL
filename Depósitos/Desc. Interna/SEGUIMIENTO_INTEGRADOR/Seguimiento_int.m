%% BORRAMOS DATOS ANTERIORES
clc;
clear all;
close all;

%% CARGAMOS EL MODELO DISCRETO %
Tm = 10;
run Mod.m


%% CONTROLADOR DE SEGUIMIENTO CON INTEGRADOR
% Condición de controlabilidad
n=rank(ctrb(Ad,Bd))

% Extensión vector de estados
AA = [  Ad  Bd;
       0 0 0 0 ];
BB = [0; 0; 0; 1];

% Ubicamos polos
Z=0; % Dead-beat

% Calculamos KK meddiante Ackerman
KK = [0 0 0 1]*ctrb(AA,BB)^(-1)*AA^4;

% Hallamos las K1 y K2 del controlador:
KKK = (KK+[0 0 0 1])*([Ad-eye(3) Bd; Cd*Ad Cd*Bd]^(-1))

%% Comprobamos:
tsim = 350;
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
legend ('Qc');
ylabel('Caudal de entrada (m^3/s)');
xlabel('Tiempo(s)');