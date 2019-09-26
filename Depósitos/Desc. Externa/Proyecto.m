close all;
clear all;
clc;

% % % % % DISEÑAMOS COMPUTADORA % % % % % % 
% % % % % CAMBIAR NOMBRE CONTROLADOR ESCALÓN % % % % % 
% mex ('Computadora.c');
% % % % % 
tsim = 800;
Tm = 10;

% % % % % DATOS MODELO SOBREAMORTIGUADO DEL SISTEMA % % % % % 
Ueq = 4.0;
Yeq = 44.78;
Yesc = 100.8;
test = 70;
K = (Yesc-Yeq)/2.0;
Tau = (129.5-100);
Tau1 = Tau*0.87;
Tau2 = Tau*0.13;
numG = K;
denG = conv([Tau1 1],[Tau2 1]);
G = tf (numG, denG);



% % % % % DATOS MODELO EN DISCRETO DEL SISTEMA % % % % % 

Gd = c2d (G,Tm);

% % % % % DATOS MODELO EN DISCRETO DEL SISTEMA % % % % % 

% % % % % % 
Kd=K/(Tau1*Tau2);
a = 1/(Tau1);
b = 1/(Tau2);
Ea = exp(-a*Tm);
Eb = exp(-b*Tm);
A = (b*(1-Ea)-a*(1-Eb))/(a*b*(b-a));
B = (a*Ea*(1-Eb)-b*Eb*(1-Ea))/(a*b*(b-a));
% % % % % 
numGdd = Kd.*[A B];
denGdd = conv([1 -Ea],[1 -Eb]);
Gdd = tf(numGdd,denGdd,-1);


% % % % % SIMULACIÓN Y PLOTEO % % % % % 
% figure;
% sim ('sk_Depositos_mod');
% subplot (3,1,1:2); 
% % plot (t,H3,t,H3mdd); grid;
% plot (t,H3,t,H3m,'r',t,H3md,'g.',t,H3mdd,'y.');grid;
% title ('Comparación modelos Tm=1s');
% ylabel ('H3 (cm)');
% xlabel ('tiempo (s)');
% legend('Sist. Real','G(s)','Gd(s)','Gdd(s)')
% subplot (3,1,3);
% plot (t/Tm,Qc,'k.');grid;
% ylabel ('Qc (l/min)');
% xlabel ('tiempo (s)');






%% % % % % % % % % % % % CONTROL DEL CDD % % % % % % % % % % %

Kc = 1/Tau;
numCd =          Kc*Gdd.den{1};
denCd = conv([1 -1],Gdd.num{1});
Cd = tf(numCd,denCd,-1);

[r,p,k] = residue(numCd,denCd);
Cdsim1 = tf(r(1),[1 -p(1)],-1);
Cdsim2 = tf(r(2),[1 -p(2)],-1);
Gbad = Gdd*Cd;
figure;
zplane(Gbad.num{1},Gbad.den{1});zgrid;grid;







%% % % % % % % % CONTROLADOR C(s) % % % % % % %
% 
Kc = 1/Tau;
numC = Kc*denG;
denC = numG*[1 0];
C = tf(numC,denC);
Gba = tf(Kc,[1 0]);

% % % % % % % % PARÁMETROS PID % % % % % % %

Kp = 0.0357; Ti= 29.4985; Td = 3.336;
PID = tf (Kp*[Ti*Td Ti 1],[Ti 0]);

figure;
bode (Gba,Gbad); grid;


% % % % % % % % CAMBIAR A ControladorC2D.c % % % % % % %

mex ('Computadora.c');


sim ('sk_Depositos_control');
figure;
subplot (3,1,1:2); 
plot (t,H3,t,rk,'r');grid;
title ('Controlador');
ylabel ('H3 (cm)');
xlabel ('tiempo (s)');
subplot (3,1,3);
plot (t,Qc,'k.');grid;
ylabel ('Qc (l/min)');
xlabel ('tiempo (s)');











