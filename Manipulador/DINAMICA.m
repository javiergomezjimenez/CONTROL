
%% CARGAMOS LOS PARÁMETROS DINÁMICOS DE R-3GDL
NE_R3GDL;

%% CARGAMOS EL MODELO DEL TOOLBOX (P.CORKE)
RTB_Robot_3GDL;

return              % Descomentar para comparar modelos

%% COMPARAMOS LA BONDAD DE NUESTRO MÉTODO (ANALÍTICO VS P. CORKE)
tsim = 1;                  % Duración de la simulación
sim('sl_R3GDL_MFunction'); % Analítico
sim('sl_R3GDL_RTB');     % P. Corke (Comentado para)

% GRÁFICAS DE LOS RESULTADOS
Grafica_32(t_RTB, t_M, q_RTB(:,1), q_M(:,1),q_RTB(:,2), q_M(:,2),q_RTB(:,3), q_M(:,3), "Posiciones",["Q1" "Q2" "Q3"],["P-Corke" "M-Function"])
Grafica_32(t_RTB, t_M, qd_RTB(:,1), qd_M(:,1),qd_RTB(:,2), qd_M(:,2),qd_RTB(:,3), qd_M(:,3), "Velocidades",["Qd1" "Qd2" "Qd3"],["P-Corke" "M-Function"])
Grafica_32(t_RTB, t_M, qdd_RTB(:,1), qdd_M(:,1),qdd_RTB(:,2), qdd_M(:,2),qdd_RTB(:,3), qdd_M(:,3), "Aceleraciones",["Qdd1" "Qdd2" "Qdd3"],["P-Corke" "M-Function"])
