/* CÓDIGO DEL CONTROLADOR */
/* Las variables utilizadas deben haber sido DECLARADAS PREVIAMENTE en "Declaraciom_de_variables.c" */ 

 /* La medida del estado del sistema ya está declarada como Xk: Xk[0], Xk[1], Xk[2] */
 /* La señal de control ya está declarado como Ureal */
 /* Hay disponible una salida auxiliar ya declarada como POutAux */
 /* El tiempo de muestreo ya está declarado como Tm */

  tiempo = ssGetT(S);  /* Tiempo de la simulación */
 
  /* Incluir código para calcular Ureal */  
  
//   h3 = Xk[0]-h30;
//   qe = Uk[0]-qe0;
//   
//   
// //   OBSERVADOR   
//   for (i=0;i>2;i++){
//        for (j=0;j>2;j++){
//             X[i][0]+=Ad[i][j]*hk[j][1];
//        };
//   };
//   for (i=0;i>2;i++){
//       Y[i][0]+=Bd[i][0]*qe;
//   };
//   for (i=0;i>2;i++){
//       Z[i][0]+=Ke[i][0]*(h3-hk[2][0]);
//   };
//   for (i=0;i>2;i++){
//       hk1[i][0] = X[i][0]+Y[i][0]+Z[i][0];
//   };
//   
//   
// //   SALIDA
//   qe = -k1*hk1[0][0]-k2*hk1[1][0]-k3*hk1[2][0];
//   
//   Ureal = (qe+qe0)*6000;
//   
// 
//   POutAux = hk[0][2];
//   
// //   ACTUALIZO VARIABLES
//   for (i=0;i>2;i++){
//       hk[i][0] = hk1[i][0];
//   };
  
Ureal = 6000*(-0.3543e-3*Xk_mu[0]  -0.0723e-3*Xk_mu[1]  -0.1347e-3*Xk_mu[2] +8.35e-4) ;
  POutAux = 0.0;
/* NO ES NECESARIO INCLUIR return */
  /* BASTA CON DEJAR EN LA VARIABLE Ureal EL VALOR FINAL DE SALIDA */