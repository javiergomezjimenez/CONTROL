/* CÓDIGO DEL CONTROLADOR EULER 2 CON AW*/


//     q0 = Kp*(1+Td/Tm+Tm/Ti);
//     q1 = Kp*(-1-2*Td/Tm);
//     q2 = Kp*(Td/Tm);

  tiempo = ssGetT(S);  /* Tiempo de la simulación */
  uk = 0;    
  rk = Yeq;
  
  interr += ek1; 
  interrsat += esat;
  if (tiempo>test+50)
  {
      rk=Yeq+40;
  };
  if (tiempo>300)
  {
      rk=Yeq+500;
  };
   if (tiempo>600)
  {
      rk=Yeq+40;
  };
  if (tiempo>test)
  {
      ek=rk-Yk;
      uk = Kp*(ek+Tm/Ti*interr+Td/Tm*(ek-ek1))+Kp/Tt*interrsat;
//       uk = uk1+q0*ek+q1*ek1+q2*ek2;
  };

 POutAux = rk;
 



 
 
/* Actualización de variables */
uk3=uk2; uk2=uk1; uk1=uk;
ek3=ek2; ek2=ek1; ek1=ek;
/* Cálculo de la señal de la salida real */
Ureal=Ueq+uk;
Uasat=Ureal;
/* Saturación de la salida real (como medida de seguridad) */
if (Ureal > Umax ) Ureal=Umax;
else if (Ureal < Umin ) Ureal=Umin;

esat = Ureal-Uasat;