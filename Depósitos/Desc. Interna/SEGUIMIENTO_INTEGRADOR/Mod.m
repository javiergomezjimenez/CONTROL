%%  Linealización y discertizacion del modelo
%parametros conocidos del sistema
A1=40e-4;
A2=10e-4;
A3=30e-4;
%punto de equilibrio
qe0=5/6000;
qp0=1/6000;
%experimentalmente obtenemos
h10=2.48;
h20=1.97;
h30=1;
%para futuros usos en simulink, los pasamos a Dl/min
qe0=5;  %Dl/min
qp0=1;  %Dl/min
%suponemos k1=k2=k3
k=1e-3;
k1=1e-3;
k2=1e-3;
k3=1e-3;
%la matriz A con estas K es:
Ac=[-0.1750      0.1750      0;
    0.7001      -1.2214     0.5213;
    0           0.1738      -0.3364];
%la matriz B
Bc=[1/A1;
    0;
    0];
Cc=[0 0 1];
Dc=0;


%% Discretizamos el modelo
[Ad,Bd,Cd,Dd]=c2dm(Ac,Bc,Cc,Dc,Tm,'zoh');


