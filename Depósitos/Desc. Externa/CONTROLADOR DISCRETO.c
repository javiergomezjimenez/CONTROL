* C�DIGO DEL CONTROLADOR */
/* Las variables utilizadas deben haber sido DECLARADAS PREVIAMENTE en "Declaraciom_de_variables.c" */ 

 /* La medida salida del sistema ya est� declarada como Yk */
 /* La se�al de control ya est� declarado como Ureal */
 /* Hay disponible una salida auxiliar ya declarada como POutAux */
 /* El tiempo de muestreo ya est� declarado como Tm */

  tiempo = ssGetT(S);  /* Tiempo de la simulaci�n */
  
  
  uk = 0;    
  rk = Yeq;
      
  if (tiempo>test+30)
  {
      rk=Yeq+20;
      ek=rk-Yk;
      uk = ek1*0.00121+uk1-0.4315*ek1-0.9*uk1+ek; /* DESCOMPOSICI�N EN GRACCIONES SIMPLES Y DESPU�S IMPLEMENTACI�N EN PARALELO */
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
  
  
  
 
  
  
  /* NO ES NECESARIO INCLUIR return */
  /* BASTA CON DEJAR EN LA VARIABLE Ureal EL VALOR FINAL DE SALIDA */