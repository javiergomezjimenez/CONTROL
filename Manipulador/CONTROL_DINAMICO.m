%% CALCULAMOS LAS CONSTANTES DE LOS CONTROLADORES
% FT_Generales; 

%% SIMULACIÓN DE LOS CONTROLADORES %%
% PREPARAR BLOQUE CON set_param(gcb,'SampleTime','0.001')
% SELECCIONAR UN CONTROLADOR ANTES

tsbc = 0.1;
N_Puntos = 100; P_Ini = [-0.1; 0.2; 0.5]; P_Fin = [-0.25; 0.05; 0.65];
% TIEMPOS DE LA SIMULACIÓN (Están calculados CUIDADOSAMENTE)
t_mov = (N_Puntos/10 + 1)*tsbc;  t_ini = 3; tsim = t_ini + t_mov*1.5; 

sim ('Control_mod_sim'); % Corremos la simulación

% PLOTEO DE RESULTADOS
figure;
plot2([xr yr zr]);
hold;
plot2([x y z]);
grid; 
Grafica_32(t, t, qr(:,1), q(:,1),qr(:,2), q(:,2),qr(:,3), q(:,3), "Posiciones",["Q1" "Q2" "Q3"],["Referencia" "Real"])
Grafica_32(t, t, qdr(:,1), qd(:,1),qdr(:,2), qd(:,2),qdr(:,3), qd(:,3), "Velocidades",["Qd1" "Qd2" "Qd3"],["Referencia" "Real"])
Grafica_32(t, t, qddr(:,1), qdd(:,1),qddr(:,2), qdd(:,2),qddr(:,3), qdd(:,3), "Aceleraciones",["Qdd1" "Qdd2" "Qdd3"],["Referencia" "Real"])