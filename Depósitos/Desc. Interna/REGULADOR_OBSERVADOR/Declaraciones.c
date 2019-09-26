/* DECLARACIÓN DE VARIABLES */

/*
 * Ya definidas:
 *   - Ureal:    señal de control (salida el controlador)
 *   - Xk:       medida del estado del sistema (3 componentes: Xk[0], Xk[1], Xk[2]  (entrada del controlador)
 *   - POutAux : salida auxiliar de libre disposición
 *   - Tm:       tiempo de muestreo
 */

#include "simstruc.h"
#include <math.h>

  /* INCLUIR AQUÍ LA DECLARACIÓN DE LAS MATRICES A, B y C */
   
 int i,j;         
 double tiempo; /* Para tiempo de simulación */
 double qe,h1,h2,h3,hk1[3][1],X[3][1],Y[3][1],Z[3][1];
 static double hk[3][1] = {{0},{0},{0}};
 static double Ke[3][1] = {{1.6464},{1.3024},{0.7503}};
 static double Ad[3][3] = {{0.5383,0.1033,0.1645},{0.4132, 0.0841, 0.1559},{0.2194, 0.0520, 0.1279}};
 static double Bd[3][1] = {{1.7448*1000},{1.0852*1000},{0.3976*1000}};
 static double Cd[3] = {0,0,1};