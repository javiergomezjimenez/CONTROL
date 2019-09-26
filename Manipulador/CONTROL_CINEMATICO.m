%% IMPLEMENTAMOS EL GENERADOR DE TRAYECTORIAS
tsbc = 0.1;
N_Puntos = 10; P_Ini = [-0.1; 0.2; 0.5]; P_Fin = [-0.25; 0.05; 0.65];
% TIEMPOS DE LA SIMULACIÓN
t_mov = (N_Puntos + 2)*tsbc;  t_ini = 0.7; tsim = t_ini + t_mov*1.5; 

sim('slGTC_3gdl');      % Simulink - generador trayectorias

% REPRESENTAMOS LOS RESULTADOS
figure;
plot2([xr yr zr]);
grid;   
Grafica_31(t, qr(:,1), qr(:,2), qr(:,3), "Posiciones", ["Q1 (rad)" "Q2 (rad)" "Q3 (rad)"]);
Grafica_31(t, qdr(:,1), qdr(:,2), qdr(:,3), "Velocidades", ["Qd1 (rad/s)" "Qd2 (rad/s)" "Qd3 (rad/s)"]);
Grafica_31(t, qddr(:,1), qddr(:,2), qddr(:,3), "Aceleraciones", ["Qdd1 (rad/s^2)" "Qdd2 (rad/s^2)" "Qdd3 (rad/s^2)"]);

