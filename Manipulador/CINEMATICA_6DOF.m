
%% CREAMOS LAS ARTICULACIONES Y CREAMOS EL ROBOT ENTERO DE 6GDOS
L1limit = 0.9; L2 = 0.5; L3 = 0.2; L4 = 0.2; L5 = 0; L6 = 0.15; L7 = 0.15; L8 = 0.1;

L(1) = Link([0 0 0 pi/2 1]);
L(2) = Link([0 0 L3 -pi/2 0]);
L(3) = Link([-pi/2 L2 0 -pi/2 0]);
L(4) = Link([0 L4+L5+L6 0 pi/2 0]);
L(5) = Link([0 0 0 -pi/2 0]);
L(6) = Link([pi/2 L7+L8 0 0 0]);


MiRobot = SerialLink(L, 'name', 'Robot 6-DOF')
figure;
MiRobot.plot([0.2 0 -pi/2 0 0 pi/2]);



%% CALCULAMOS EXPL�CITAMENTE LAS MATRICES HOMOG�NEAS
syms q1 q2 q3 q4 q5 q6 L1 L2 L3 L4 L5 L6 L7 L8
PI = sym('pi');
T1 = MDH(0, q1, 0, PI/2)
T2 = MDH(q2, 0, L3, -PI/2)
T3 = MDH(-PI/2+q3, L2, 0, -PI/2)
T4 = MDH(q4, L4+L5+L6, 0, PI/2)
T5 = MDH(q5, 0, 0, -PI/2)
T6 = MDH(PI/2+q6, L7+L8, 0, 0)*troty(-PI/2)

Tt = simplify(T1*T2*T3*T4*T5*T6)

