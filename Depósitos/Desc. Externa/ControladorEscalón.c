/* C�DIGO DEL CONTROLADOR */
/* Las variables utilizadas deben haber sido DECLARADAS PREVIAMENTE en "Declaraciom_de_variables.c" */ 

 /* La medida salida del sistema ya est� declarada como Yk */
 /* La se�al de control ya est� declarado como Ureal */
 /* Hay disponible una salida auxiliar ya declarada como POutAux */
 /* El tiempo de muestreo ya est� declarado como Tm */

  tiempo = ssGetT(S);  /* Tiempo de la simulaci�n */
 
  /* Incluir c�digo para calcular Ureal */  
  
  if (tiempo<100)
  {
        Ureal=4.0;
  }
  else
  {
        Ureal=6.0;
  }
  POutAux=0.0;
  
  
  
  
// // //   SATURACI�N
  
  if (Ureal>10)
  {
          Ureal=10;
  }
  else if (Ureal<0)
  {
          Ureal=0;
  };
  
  
  /* NO ES NECESARIO INCLUIR return */
  /* BASTA CON DEJAR EN LA VARIABLE Ureal EL VALOR FINAL DE SALIDA */