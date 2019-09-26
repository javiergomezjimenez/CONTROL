/*
 *  Modelo para un Controlador mediante realimentación del estado implementado en tiempo discreto
 *  
 *  El modelo tiene una entrada:
 *  -  Estado del sistema: Xk (3 componentes): Xk[0], Xk[1], Xk[2]
 *
 *  La salida del controlador se denominará: Ureal
 *  El puerto de salida auxiliar se llamará POutAux
 *
 *  ESTOS NOMBRE NO DEBERÁN SER MODIFICADOS
 *
 *  El tiempo de muestreo se especifica mediante el único parámetro que se introduce desde Simulink
 *  En caso de ser utilizado en el código, su nombre será Tm.
 *
 *  El alumno sólo deberá incluir al inicio del archivo las directivas tipo #define que crea conveniente,
 *  e introdicir su código del controlador sólo en los lugares indicados dentro de la
 *  función "mdlOutputs", que se encuentra casi al final del archivo.
 *
 *  M.G. Ortega  @2017
 */

#define S_FUNCTION_NAME ComputadoraSS
#define S_FUNCTION_LEVEL 2

#include "simstruc.h"
#include <math.h>

/* Variables del espacio de trabajo */
#define   FLAG_INIT       iwork[ 0]

/* Entradas y estados */
#define     Xk            (*uPtrs0)   /* Entradas al sistema */
#define     Ureal         (yPtrs0[0])   /* Salidas de sistema */   
#define     POutAux       (yPtrs1[0])


/****** LUGAR DONDE EL ALUMNO DEBE INCLUIR SUS DIRECTIVAS TIPO #define  ******/
#include "Directivas.c"

/*****************************************************************************/


static void mdlInitializeSizes(SimStruct *S)
{
    ssSetNumSFcnParams(S, 1);       /* Número de parámetros esperados: 1 */
    if (ssGetNumSFcnParams(S) != ssGetSFcnParamsCount(S)) {
        return; /*Si faltan parametros se da mensaje */
    }
    
    ssSetNumContStates(    S, 0);      /* Número de estados continuos: 0 */
    ssSetNumDiscStates(    S, 0);      /* Número de estados discretos: 0 */

    if (!ssSetNumInputPorts(S, 1)) return;      /* 1 puerto de entrada (Puertos: 0) */
    ssSetInputPortWidth(S, 0, 3);               /* Dimensión del puerto de entrada 0: 3 entradas */
    ssSetInputPortDirectFeedThrough(S, 0, 1);   /* y 1 salida directa desde el puerto 0 */

    if (!ssSetNumOutputPorts(S,2)) return;      /* 2 puertos de salida */
    ssSetOutputPortWidth(S, 0, 1);          /* Dimensión del puerto de salida 0: señal de control (1) */
    ssSetOutputPortWidth(S, 1, 1);          /* Dimensión del puerto de salida 1: puerto de salida auxiliar (1) */
    
    ssSetNumSampleTimes(   S,  1);      /* Numero de muestreos */
    ssSetNumRWork(         S,  0);      /* Vector de numeros reales (rwork) */
    ssSetNumIWork(         S,  1);      /* Vector de numeros enteros (iwork) */
    ssSetNumPWork(         S,  0);      /* Vector de punteros */
    ssSetNumModes(         S,  0);      /* Vector de modos de trabajo */
    ssSetNumNonsampledZCs(S,   0);      /* Número de paso por cero sin muestreo */
    ssSetOptions(S, SS_OPTION_EXCEPTION_FREE_CODE);
 }


 /*
 * mdlInitializeSampleTimes - Inicializa muestreos 
 */
static void mdlInitializeSampleTimes(SimStruct *S)
{
    real_T  Tm = mxGetPr(ssGetSFcnParam(S,0))[0];  /* Parámetro 1 */
    if (Tm<1.e-8)
    {
     printf("\n\n Valor del tiempo de muestreo no válido\n\n");
     ssSetStopRequested(S,1);
    }
    ssSetSampleTime(S, 0, Tm );  /* Automatico segun bloque anterior */
    ssSetOffsetTime(S, 0, 0.0);
}


#define MDL_INITIALIZE_CONDITIONS
static void mdlInitializeConditions(SimStruct *S)
{
 int_T  *iwork = ssGetIWork(S); /* Puntero al vector de n. enteros */
 FLAG_INIT = 1;   
}



/*****************************************************/
/*  ESTA ES LA FUNCIÓN QUE DEBE MODIFICAR EL ALUMNO  */
/*****************************************************/

static void mdlOutputs(SimStruct *S, int_T tid)
{
 /***** NO MODIFICAR  ****/

  real_T *yPtrs0 = ssGetOutputPortRealSignal(S,0);          /* Accede a la salida 0 vía un puntero */
  real_T *yPtrs1 = ssGetOutputPortRealSignal(S,1);          /* Accede a la salida 1 vía un puntero */
    
  InputRealPtrsType uPtrs0 = ssGetInputPortRealSignalPtrs(S,0);      /* Accede a la entrada 0 vía un puntero */
  int_T  *iwork = ssGetIWork(S); /* Puntero al vector de n. enteros */
  real_T  Tm = mxGetPr(ssGetSFcnParam(S,0))[0];  /* Tiempo de muestreo */

  
/***************************************************/ 
/* INCLUIR AQUÍ LAS DECLARACIONES DE LAS VARIABLES */ 
/***************************************************/ 
  #include "Declaraciones.c"


/****************************************************/    
 if (FLAG_INIT)
 {
 /***************************************************************/
 /* INCLUIR AQUÍ SÓLO LA INICIALIZACIÓN (NO LA DECLARACIÓN)     */
 /*        DE LAS VARIABLES TIPO STATIC                         */
 /***************************************************************/
   #include "Inicializaciones.c"

  
 
 
/*****************************************************************/ 
    FLAG_INIT=0;
 }


/*******************************************************/
/*   CÓDIGO DEL PROGRAMA DEL CONTROLADOR               */
/*******************************************************/
   #include "Controlador.c"
  
  /* NO ES NECESARIO INCLUIR return */
  /* BASTA CON DEJAR EN LA VARIABLE Ureal EL VALOR FINAL DE SALIDA */  
}


static void mdlTerminate(SimStruct *S)
{
}


#ifdef  MATLAB_MEX_FILE    
#include "simulink.c"      
#else
#include "cg_sfun.h"       
#endif
