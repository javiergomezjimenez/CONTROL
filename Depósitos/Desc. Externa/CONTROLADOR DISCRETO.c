* CÓDIGO DEL CONTROLADOR */
/* Las variables utilizadas deben haber sido DECLARADAS PREVIAMENTE en "Declaraciom_de_variables.c" */ 

 /* La medida salida del sistema ya está declarada como Yk */
 /* La señal de control ya está declarado como Ureal */
 /* Hay disponible una salida auxiliar ya declarada como POutAux */
 /* El tiempo de muestreo ya está declarado como Tm */

  tiempo = ssGetT(S);  /* Tiempo de la simulación */
  
  
  uk = 0;    
  rk = Yeq;
      
  if (tiempo>test+30)
  {
      rk=Yeq+20;
      ek=rk-Yk;
      uk = ek1*0.00121+uk1-0.4315*ek1-0.9*uk1+ek; /* DESCOMPOSICIÓN EN GRACCIONES SIMPLES Y DESPUÉS IMPLEMENTACIÓN EN PARALELO */
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
  
  
  
 
  
  
  /* NO ES NECESARIO INCLUIR return */
  /* BASTA CON DEJAR EN LA VARIABLE Ureal EL VALOR FINAL DE SALIDA */