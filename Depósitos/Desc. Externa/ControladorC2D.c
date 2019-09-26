/* CÓDIGO DEL CONTROLADOR */
  tiempo = ssGetT(S);  /* Tiempo de la simulación */
  uk = 0;    
  rk = Yeq;
  
  if (tiempo>test+50)
  {
      rk=Yeq+20;
  };
  if (tiempo>test)
  {
      ek = rk-Yk;
      uk = (0.339*ek-0.2546*ek1+0.01692*ek2+3.765*uk1+2.304*uk2)/6.069;
  };
 POutAux = rk;

/* Actualización de variables */
uk3=uk2; uk2=uk1; uk1=uk;
ek3=ek2; ek2=ek1; ek1=ek;
/* Cálculo de la señal de la salida real */
Ureal=Ueq+uk;
/* Saturación de la salida real (como medida de seguridad) */
if (Ureal > Umax ) Ureal=Umax;
else if (Ureal < Umin ) Ureal=Umin;
 