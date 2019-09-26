/* C�DIGO DEL CONTROLADOR */
/* Las variables utilizadas deben haber sido DECLARADAS PREVIAMENTE en "Declaraciom_de_variables.c" */ 

 /* La medida salida del sistema ya est� declarada como Yk */
 /* La se�al de control ya est� declarado como Ureal */
 /* Hay disponible una salida auxiliar ya declarada como POutAux */
 /* El tiempo de muestreo ya est� declarado como Tm */

    q0 = Kp*(1+Tm/(2*Ti)+Td/Tm);
    q1 = Kp*(-1+Tm/(2*Ti)-2*Td/Tm);
    q2 = Kp*(Td/Tm);

  tiempo = ssGetT(S);  /* Tiempo de la simulaci�n */
  uk = 0;    
  rk = Yeq;
  
  if (tiempo>test+50)
  {
      rk=Yeq+20;
  };
  if (tiempo>test)
  {
      ek=rk-Yk;
      uk = uk1+q0*ek+q1*ek1+q2*ek2;
  };
  
 POutAux = rk;

/* Actualizaci�n de variables */
uk3=uk2; uk2=uk1; uk1=uk;
ek3=ek2; ek2=ek1; ek1=ek;
/* C�lculo de la se�al de la salida real */
Ureal=Ueq+uk;
/* Saturaci�n de la salida real (como medida de seguridad) */
if (Ureal > Umax ) Ureal=Umax;
else if (Ureal < Umin ) Ureal=Umin;
  
  
  

