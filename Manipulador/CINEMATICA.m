
%% DESACOPLAMOS LA MANO
L1limit = 0.9; L2 = 0.5; L3 = 0.2; L4 = 0.2; 

L(1) = Link([0 0 0 pi/2 1]);
L(2) = Link([0 0 L3 -pi/2 0]);
L(3) = Link([0 L2 L4 0 0]);

R3GDL = SerialLink(L, 'name', 'BRAZO');
% figure;
% R3GDL.plot([0 0.5 0.5]);
%% % % % MATRICES DE TRANSFORMACIÓN DEL BRAZO % % % %
syms q1 q2 q3 q4 q5 q6 L1 L2 L3 L4 x y z
PI = sym('pi');
% PASOS INTERMEDIOS %
L1limit = 0.9; L2 = 0.5; L3 = 0.2; L4 = 0.2;
T1 = MDH(0, q1, 0, PI/2);
T2 = MDH(q2, 0, L3, -PI/2);
T3 = MDH(q3, L2, L4, 0);
Tt2 = simplify(T1*T2*T3);



%% EL MCD Y EL MCI ESTÁN EN FUNCIONES APARTE, AQUI SE PONEN MATRICIALMENTE:

MCDa = simplify ([cos(q2)/5 - sin(q2)/2 + (cos(q2)*cos(q3))/5;...
    sin(q3)/5;...
    q1 + cos(q2)/2 + sin(q2)/5 + (cos(q3)*sin(q2))/5]);

MCIa = simplify ([z - ((1 - (20*x + 5*(8*(1 - 25*y^2)^(1/2) - 100*y^2 - 100*x^2 + 33)^(1/2) + 20*x*(1 - 25*y^2)^(1/2))^2/(8*(1 - 25*y^2)^(1/2) - 100*y^2 + 33)^2)^(1/2)*(1 - 25*y^2)^(1/2))/5 - (20*x + 5*(8*(1 - 25*y^2)^(1/2) - 100*y^2 - 100*x^2 + 33)^(1/2) + 20*x*(1 - 25*y^2)^(1/2))/(2*(8*(1 - 25*y^2)^(1/2) - 100*y^2 + 33)) - (1 - (20*x + 5*(8*(1 - 25*y^2)^(1/2) - 100*y^2 - 100*x^2 + 33)^(1/2) + 20*x*(1 - 25*y^2)^(1/2))^2/(8*(1 - 25*y^2)^(1/2) - 100*y^2 + 33)^2)^(1/2)/5;...
acos((20*x + 5*(8*(1 - 25*y^2)^(1/2) - 100*y^2 - 100*x^2 + 33)^(1/2) + 20*x*(1 - 25*y^2)^(1/2))/(8*(1 - 25*y^2)^(1/2) - 100*y^2 + 33));...
asin(5*y)]);


%% JACOBIANOS
syms q1 q2 q3 x y z
JD = simplify(jacobian(MCDa, [q1 q2 q3]));
JI = simplify(vpa(jacobian(MCIa, [x y z])),2);

Sing = fsolve (@fJD,2);


return




%% TRAYECTORIA CIRCULAR
r = 0.2;       cte = 0.7;
z = cte;
x = [-0.2:0.01:0.2];
y1 = sqrt(r^2-x.^2);
y2 = -sqrt(r^2-x.^2);
hold on
for n = 1:41
    POS = [x(n) y1(n) cte];
    aux = CinematicaInversa(POS);
    Q(n,1) = aux(1); Q(n,2) = aux(2); Q(n,3) = aux(3);
    R3GDL.plot(Q(n,1:3))
    plot2(POS,'r.');
end    
for n = 2:41
    POS = [x(42-n) y2(42-n) cte];
    aux = CinematicaInversa(POS);
    Q(40+n,1) = aux(1); Q(40+n,2) = aux(2); Q(40+n,3) = aux(3);
    R3GDL.plot(Q(40+n,1:3))
    plot2(POS,'r.');
end

% DIBUJAMOS LAS ARTICULACIONES FRENTE AL TIEMPO
m = [0:1:80];
titulo = 'Q1 frente al muestreo';
Ytitle = 'Metros';
Ytitle2 = '';
Leyenda = char ('');
Leyenda2 = char ('');
grafica_v3 (m,Q(:,1), Ytitle, Leyenda,Q(:,1), Ytitle2, Leyenda2, titulo);
titulo = 'Q2 frente al muestreo';
Ytitle = 'Grados';
grafica_v3 (m,(Q(:,2)*180/pi), Ytitle, Leyenda,(Q(:,2)*180/pi), Ytitle2, Leyenda2, titulo);
titulo = 'Q3 frente al muestreo';
grafica_v3 (m,(Q(:,3)*180/pi), Ytitle, Leyenda,(Q(:,3)*180/pi), Ytitle2, Leyenda2, titulo);


