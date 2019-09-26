/* C�DIGO DEL CONTROLADOR */
/* Las variables utilizadas deben haber sido DECLARADAS PREVIAMENTE en "Declaraciom_de_variables.c" */ 

 /* La medida del estado del sistema ya est� declarada como Xk: Xk[0], Xk[1], Xk[2] */
 /* La se�al de control ya est� declarado como Ureal */
 /* Hay disponible una salida auxiliar ya declarada como POutAux */
 /* El tiempo de muestreo ya est� declarado como Tm */

  tiempo = ssGetT(S);  /* Tiempo de la simulaci�n */
 
  /* Incluir c�digo para calcular Ureal */  
  
  h1 = Xk[0]-h10;
  h2 = Xk[1]-h20;
  h3 = Xk[2]-h30;
  
  qe = -k1*h1-k2*h2-k3*h3;
  Ureal = 6000*(qe+qe0);
  POutAux = 0.0;
  
  
  /* NO ES NECESARIO INCLUIR return */
  /* BASTA CON DEJAR EN LA VARIABLE Ureal EL VALOR FINAL DE SALIDA */