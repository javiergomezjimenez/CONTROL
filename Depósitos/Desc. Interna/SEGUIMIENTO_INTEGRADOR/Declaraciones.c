/* DECLARACIÓN DE VARIABLES */

/*
 * Ya definidas:
 *   - Ureal:    señal de control (salida el controlador)
 *   - Xk:       medida del estado del sistema (3 componentes: Xk[0], Xk[1], Xk[2]  (entrada del controlador)
 *   - POutAux : salida auxiliar de libre disposición
 *   - Tm:       tiempo de muestreo
 */

  double tiempo; /* Para tiempo de simulación */
  double qe,h1,h2,h3,ek,Vk,Aek;
  static double Vk1, ek1;