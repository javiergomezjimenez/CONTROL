
% Defición genérica del reposo (no interviene en el modelo)
q1=0; q2=0; q3=0;

% DATOS CINEMÁTICOS DEL BRAZO DEL ROBOT
% Dimensiones (m) vienen dados de la CINEMATICA
  L0 = 0;        % Base
  L1 = 0;        % Eslabón 1 
  L2 = L2;       % Eslabón 2
  L3 = L3;       % Eslabón 3 (Tiene dos longitudes, es diagonal)
  L4 = L4;      
  
% Parámetros de Denavit-Hartenberg (utilizado en primera regla de Newton-Euler)
% Eslabón base (no utilizado)
  theta0 = 0; d0 = L0; a0 = 0; alpha0 = 0;
% Eslabón 1:
  theta1= 0; d1= q1; a1=0 ; alpha1=PI/2 ;
% Eslabón 2:
  theta2= q2; d2= 0; a2= L3; alpha2= -PI/2;
% Eslabón 3:
  theta3= q3; d3= L2; a3= L4; alpha3= 0;
% Entre eslabón 3 y marco donde se ejerce la fuerza (a definir según
% experimento)
  theta4= 0; d4= 0; a4= 0; alpha4= 0;

% DATOS DINÁMICOS DEL BRAZO DEL ROBOT
% Eslabón 1
  m1= 4.5; % kg
  s11 = [ 0,  0, -q1/2]'; % m
  I11=[ 0.25,  0,  0; 0, 0.2, 0; 0, 0, 0.15]; % kg.m2

% Eslabón 2
  m2= 4; % kg
  s22 = [ -L3/2, 0 ,0 ]'; % m
  I22=[ 0.35,0  ,0  ; 0,  0.25,0 ; 0, 0,0.2 ]; % kg.m2

% Eslabón 3
  m3= 3.2; % kg
  s33 = [ -L3/2,  0, -L4/2]'; % m
  I33=[ 0.06, 0 , 0 ; 0, 0.05 ,0 ; 0, 0, 0.07]; % kg.m2


% DATOS DE LOS MOTORES
% Inercias
  Jm1=0.15 ; Jm2=0.2; Jm3=0.07; % kg.m2

% Coeficientes de fricción viscosa
  Bm1 = 3.6e-5; Bm2 = 3.6e-5; Bm3 = 3.6e-5; % N.m / (rad/s)

% Factores de reducción
  R1 = 25; R2 = 20; R3 = 25;

% Aceleración de la gravedad
g = 9.8;    

% En caso de no ulilizar variables simbólicas
% Parámetros de Denavit-Hartemberg  DH = [THETA D A ALPHA SIGMA OFFSET]
%                                                   SIGMA(0:R, 1:T)
%             theta_i  d_i  a_i  alpha_i  sigma offset   standard 
 L(1) = Link([theta1   d1   a1   alpha1   1      L1], 'standard');
 L(2) = Link([theta2   d2   a2   alpha2   0      0 ], 'standard');
 L(3) = Link([theta3   d3   a3   alpha3   0      0 ], 'standard');

% Definición de los parámetros dinámicos de los eslabones
% Masas
L(1).m = m1;
L(2).m = m2;
L(3).m = m3;
% Posición del centro de gravedad respecto al sistema de ref. local
%                 rx      ry      rz
L(1).r = s11'; % [0    0       0 ];  % Cuidado con el signo -
L(2).r = s22'; % [0    0       0 ];
L(3).r = s33'; % [0    0       0 ];

% Parámetros de inercia respecto al sistema de referencia local
%        Ixx     Iyy      Izz    Ixy     Iyz     Ixz
%L(1).I = [I1xx   I1yy     I1zz   I1xy    I1xz    I1yz];
% Tambien admite: L(1).I = [0 0 0; 0 0 0; 0 0 0.35];
L(1).I = I11;
L(2).I = I22;
L(3).I = I33;

% Inercia del actuador
L(1).Jm =  Jm1;
L(2).Jm =  Jm2;
L(3).Jm =  Jm3;

% Fricción viscosa del actuador
L(1).B =  Bm1;
L(2).B =  Bm2;
L(3).B =  Bm3;

% Relación de transformación de la reductora
L(1).G =  R1; % Accionamiento directo
L(2).G =  R2;
L(3).G =  R3;

% Definición del robot con los datos anteriores
R3GDL = SerialLink(L, 'name','ROBOT DE 3GDL');

R3GDL.gravity = [0 0 9.8]';

clear L %Borramos L ya que no lo necesitaremos más

