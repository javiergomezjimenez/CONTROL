function [tau] = controlador (in)

qr(1)=      in(1);
qr(2)=      in(2);
qr(3)=      in(3);

q(1)=       in(4);
q(2)=       in(5);
q(3)=       in(6);

qdr(1)=     in(7);
qdr(2)=     in(8);
qdr(3)=     in(9);

qd(1)=      in(10);
qd(2)=      in(11);
qd(3)=      in(12);

qddr(1)=    in(13);
qddr(2)=    in(14);
qddr(3)=    in(15);

tiempo=     in(16);


%matrices dinámicas

%igualamos términos para las matrices del modelo
q1=q(1);q2=q(2);q3=q(3);
qd1=qd(1);qd2=qd(2);qd3=qd(3);

% Factores de reducción
  R1= 25; R2= 20; R3= 25;
  R=[R1;R2;R3];            
% Matriz de Inercias
  M=                            [2109/20    (26*cos(q2))/25-(32*sin(q2))/25+(8*cos(q2)*cos(q3))/25   -(8*sin(q2)*sin(q3))/25;...
         (26*cos(q2))/25-(32*sin(q2))/25+(8*cos(q2)*cos(q3))/25  (16*cos(q3))/125+(11*cos(q3)^2)/500+8099/100  (16*sin(q3))/125;...
                                                                     -(8*sin(q2)*sin(q3))/25     (16*sin(q3))/125    10963/250];
 
% Matriz de aceleraciones centrípetas y de Coriolis
  V=    [(9*qd1)/400-(32*qd2^2*cos(q2))/25-(26*qd2^2*sin(q2))/25-(8*qd2^2*cos(q3)*sin(q2))/25-(8*qd3^2*cos(q3)*sin(q2))/25-(16*qd2*qd3*cos(q2)*sin(q3))/25;...
                                                                            (9*qd2)/625-(qd3*(32*qd2*sin(q3)-32*qd3*cos(q3)+11*qd2*cos(q3)*sin(q3)))/250;...
                                                                                                     (9*qd3)/400+(qd2^2*(11*sin(2*q3)+64*sin(q3)))/1000];


 
% Par gravitatorio                
  G = 9.8*[117/10;  ...
      (26*cos(q2))/25-(32*sin(q2))/25+(8*cos(q2)*cos(q3))/25;...
      -(8*sin(q2)*sin(q3))/25];
            
           

              
%%%%%%%%%%%%%%%%%% CÓDIGO DEL CONTROLADOR %%%%%%%%%%%%%%%

Tm=0.001; % (tsbc = 0.1s)

% Variables persistentes para conservar el estado

persistent Int_err u ;


if (tiempo<0.01*Tm) % Para asegurarnos de que se inicie a 0 y no conserve el estado.
    Int_err= [0; 0; 0];
    u=[0;0;0];
end
    

% Calculamos los errores y actualizamos variables.

err_q = (qr'-q');
err_qd = (qdr'-qd');

% Controladores


    
if(0) % PD => (C(s) = Kc*(Td*s + 1))
   
    if(0)   % Compensación gravedad G(s)=1/(Ma*S^2+Bm*R^2*S) 
        Kp = [1.5849e+04;1.3646e+04;7.4131e+03];
        Kd = Kp.*[0.1805;0.1805;0.1805]; % Tiene los valores de Td
    end
    
    if(0)   % Compensación gravedad y coriolis G(s)=1/Ma*S^2
        Kp = [1.8408e+04;1.4125e+04;7.6736e+03];
        Kd = Kp.*[0.1805;0.1805;0.1805]; % Tiene los valores de Td
    end

    if(0)   % Compensación completa y par calculado G(s)=1/S^2
        Kp = [177.8279;177.8279;177.8279];
        Kd = Kp.*[0.1805;0.1805;0.1805]; % Tiene los valores de Td
    end
    
    u = Kp.*err_q + Kd.*err_qd; % Ley de control PD discreto
    
end   

if(1) % PID (C(s)=> Kc((tau*S +1)^2)/tau*s)
       
    Int_err = Int_err + Tm.*err_q;   

    if(0) %Compensación de gravedad G(s)=1/(Ma*S^2+Bm*R^2*S) 
        Kp=[ 1.7657e+04; 1.3550e+04; 7.2766e+03];
        Kd=[ 3.2122e+03; 2.4649e+03; 1.3237e+03]; 
        Ki=[ 2.4266e+04; 1.8621e+04; 10000]; 
    end

    if(0) %Compensación de gravedad y coriolis G(s)=1/Ma*S^2
        Kp=[ 1.8278e+04; 1.4026e+04; 7.6195e+03];
        Kd=[ 3.3250e+03; 2.5515e+03; 1.3861e+03]; 
        Ki=[ 2.5119e+04; 1.9275e+04; 1.0471e+04]; 
    end

    if(1) %Compensación completa y par calculado G(s)=1/S^2
        Kp=[ 172.5553; 172.5553; 172.5553];
        Kd=[ 31.3904; 31.3904; 31.3904]; 
        Ki=[ 237.1374; 237.1374; 237.1374]; 
    end
       
    u = Kp.*err_q + Kd.*err_qd+ Ki.*Int_err;  % Ley de control PID
    
end
        
% Ecuación del robot
%    Tau = M*qdd + V + G donde V=V1+B*R^2*q


% Salida del control

%   tau = u+G;                   % Salida con compensación de gravedad 
%   tau = u+G+V;                 % Salida con compensación de gravedad y coriolis 
  tau = M*(qddr+u) + V + G;   % Par calculado
  
  tau = [tau(1,1); tau(2,1); tau(3,1)]; % Para asegurar que sale un vector 
end



