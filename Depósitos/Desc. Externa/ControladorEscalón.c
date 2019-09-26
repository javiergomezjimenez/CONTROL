/* CÓDIGO DEL CONTROLADOR */
/* Las variables utilizadas deben haber sido DECLARADAS PREVIAMENTE en "Declaraciom_de_variables.c" */ 

 /* La medida salida del sistema ya está declarada como Yk */
 /* La señal de control ya está declarado como Ureal */
 /* Hay disponible una salida auxiliar ya declarada como POutAux */
 /* El tiempo de muestreo ya está declarado como Tm */

  tiempo = ssGetT(S);  /* Tiempo de la simulación */
 
  /* Incluir código para calcular Ureal */  
  
  if (tiempo<100)
  {
        Ureal=4.0;
  }
  else
  {
        Ureal=6.0;
  }
  POutAux=0.0;
  
  
  
  
// // //   SATURACIÓN
  
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