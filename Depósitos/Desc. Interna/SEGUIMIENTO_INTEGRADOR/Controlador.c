/* C�DIGO DEL CONTROLADOR */
/* Las variables utilizadas deben haber sido DECLARADAS PREVIAMENTE en "Declaraciom_de_variables.c" */ 

 /* La medida del estado del sistema ya est� declarada como Xk: Xk[0], Xk[1], Xk[2] */
 /* La se�al de control ya est� declarado como Ureal */
 /* Hay disponible una salida auxiliar ya declarada como POutAux */
 /* El tiempo de muestreo ya est� declarado como Tm */

 tiempo = ssGetT(S);  /* Tiempo de la simulaci�n */
 
  /* Incluir c�digo para calcular Ureal */  
  ek = 0;
  if (tiempo>100){     // Cierre de lazo suave a los 100s
    ek = Ref[0]-Xk[2];
    };
  Vk = Vk1+ek;
  Aek = ek - ek1;
  h1 = Xk[0]-h10;
  h2 = Xk[1]-h20;
  h3 = Xk[2]-h30;
  
  qe = -k21*h1-k22*h2-k23*h3+k1*Vk+(k1/5.5)*Aek;
  Ureal = (qe + qe0)*6000;
  
  POutAux = Ref[0];
  Vk1 = Vk;
  ek1 = ek;
  
  /* NO ES NECESARIO INCLUIR return */
  /* BASTA CON DEJAR EN LA VARIABLE Ureal EL VALOR FINAL DE SALIDA */