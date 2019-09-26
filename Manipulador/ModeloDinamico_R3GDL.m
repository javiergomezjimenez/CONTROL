function [qdd] = ModeloDinamico_R3GDL(in)
% UN SOLO ARGUMENTO DE ENTRADA Y SALIDA %
% Variables de entrada en la funcion: [q(2)  qp(2)  Imotor(2)]
q1        = in(1);
q2        = in(2);
q3        = in(3);
qd1       = in(4);
qd2       = in(5);
qd3       = in(6);
Tau1      = in(7);
Tau2      = in(8);
Tau3      = in(9);



% Matriz de Inercias
  M =                              [2109/20    (26*cos(q2))/25-(32*sin(q2))/25+(8*cos(q2)*cos(q3))/25   -(8*sin(q2)*sin(q3))/25;...
         (26*cos(q2))/25-(32*sin(q2))/25+(8*cos(q2)*cos(q3))/25  (16*cos(q3))/125+(11*cos(q3)^2)/500+8099/100  (16*sin(q3))/125;...
                                                                     -(8*sin(q2)*sin(q3))/25     (16*sin(q3))/125    10963/250];
 
% Matriz de aceleraciones centrípetas y de Coriolis
  V = [(9*qd1)/400-(32*qd2^2*cos(q2))/25-(26*qd2^2*sin(q2))/25-(8*qd2^2*cos(q3)*sin(q2))/25-(8*qd3^2*cos(q3)*sin(q2))/25-(16*qd2*qd3*cos(q2)*sin(q3))/25;...
                                                                            (9*qd2)/625-(qd3*(32*qd2*sin(q3)-32*qd3*cos(q3)+11*qd2*cos(q3)*sin(q3)))/250;...
                                                                                                     (9*qd3)/400+(qd2^2*(11*sin(2*q3)+64*sin(q3)))/1000];


% Par gravitatorio     
    G = 9.8*[117/10;  ...
      (26*cos(q2))/25-(32*sin(q2))/25+(8*cos(q2)*cos(q3))/25;...
      -(8*sin(q2)*sin(q3))/25];
            
                                      
 

% Ecuación del robot
%    Tau = M*qpp + V + G
  Tau=[Tau1;Tau2;Tau3];

% Por lo que:  
% Aceleraciones
  qdd = inv(M)*(Tau-V-G);
  