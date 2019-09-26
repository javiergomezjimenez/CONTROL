
close all;
clc;

% DATOS DINÁMICOS DEL BRAZO DEL ROBOT
  L0=0;  % base
  L1=0;  % eslabón 1 / ponemos 1 porque debe ser mayor que 0.8 (ejemplo prismatico)
  L2=0.5;  % eslabon 2
  L3=0.2;  % eslabón 3
  L4=0.2; % eslabon 4
  L23= sqrt(L2^2 + L3^2); % eslabón 2,3
  ang= atan2(L2,L3);
  syms q1 q2 q3;
  


% DATOS DE LOS MOTORES
% Inercias
  Jm1=0.15 ; Jm2=0.2; Jm3=0.07; % kg.m2
% Coeficientes de fricción viscosa
  Bm1= 3.6e-5; Bm2= 3.6e-5; Bm3= 3.6e-5; % N.m / (rad/s)
% Factores de reducción
  R1= 25; R2= 20; R3= 25;
  
% Matriz de inercias
M=                    [2109/20    (26*cos(q2))/25-(32*sin(q2))/25+(8*cos(q2)*cos(q3))/25   -(8*sin(q2)*sin(q3))/25;...
     (26*cos(q2))/25-(32*sin(q2))/25+(8*cos(q2)*cos(q3))/25  (16*cos(q3))/125+(11*cos(q3)^2)/500+8099/100  (16*sin(q3))/125;...
                                                            -(8*sin(q2)*sin(q3))/25     (16*sin(q3))/125    10963/250];

  % CONDICIÓN PARA SIMPLIFICAR %
  
  q1=0;
  q2=0;
  q3=0;
  
  
%% SOLO COMPENSACIÓN DE LA GRAVEDAD %%
%   Ma = eval(M);
%   B1 = Ma(1,1);
%   C1 = (Bm1*R1^2);
%   B2 = Ma(2,2);
%   C2 = (Bm2*R2^2);
%   B3 = Ma(3,3);
%   C3 = (Bm3*R3^2);
  
%% SOLO COMPENSACIÓN DE LA GRAVEDAD Y CORIOLIS %%
%   Ma = eval(M);
%   B1 = Ma(1,1);
%   C1 = 0;
%   B2 = Ma(2,2);
%   C2 = 0;
%   B3 = Ma(3,3);
%   C3 = 0;

%% COMPENSACIÓN COMPLETA Y PAR CALCULADO %%
  Ma = eval(M);
  B1 = 1;
  C1 = 0;
  B2 = 1;
  C2 = 0;
  B3 = 1;
  C3 = 0;



%% CÁLCULO DE LAS FUNCIONES DE TRANSFERENCIA %%
  
  A1=1; A2=1; A3=1;
  %%%    An   
  %--------------
  %%%( Bs + C )s
  
  %%modelos con el par de la articulación, sin R*tau (An=1)%%
   
num_G1=[A1];
den_G1=[B1 C1 0];
G1 = tf(num_G1, den_G1);

num_G2=[A2];
den_G2=[B2 C2 0];
G2 = tf(num_G2, den_G2);

num_G3=[A3];
den_G3=[B3 C3 0];
G3 = tf(num_G3, den_G3);


%% CÁLCULOS DE LOS PARÁMETROS %%

% % PARA EL PD % %
% wc = pi/tsbc
% phid = 80;
% Td = tan(phid*pi/180)/wc
% Adb = -45;
% K = 10^(Adb/20);
% Kp = 1/K
% 
% C = tf(1,1);
% C = tf([Td 1],1);
% C = tf(Kp*[Td 1],1);
    

% % PARA EL PID % % 
wc = pi/tsbc; % Mf > 70º
phid = 80; % phid = Mfdes (80º porque no podemos 90º) - Mfact (0º)
tau = tan((phid+90)*pi/360)/wc;
Adb = -47.5;
K = 1/(10^(Adb/20));

% C = tf(1,1);
C = tf(conv([tau 1],[tau 1]),[1 0]);
C = tf(K*conv([tau 1],[tau 1]),[1 0]);

Ti = 2*tau;
Td = 0.5*tau;
Kp = 2*tau*K
Kd = Kp*Td
Ki = Kp/Ti


bode(C*G3);
grid;

