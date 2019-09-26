/* DECLARACIÓN DE VARIABLES */

/*
 * Ya definidas:
 *   - Ureal:    señal de control (salida el controlador)
 *   - Yk:       medida de la salida del sistema (entrada del controlador)
 *   - POutAux : salida auxiliar de libre disposición
 *   - Tm:       tiempo de muestreo
 */

  double tiempo; /* Para tiempo de simulación */
  double rk;
  double ek; /* Valor del error actual */
  double uk; /* Valor incremental de la señal de control */
  static double ek1, ek2, ek3; /* Valores anteriores del error */
  static double uk1, uk2, uk3; /* Valores anteriores de la entrada */
  double q0, q1, q2;
  static double interr, interrsat, esat;
  double Uasat;