/* DIRECTIVAS DE TIPO #define */

#define h10 2.48
#define h20 1.97
#define h30 1
#define qe0 8.35e-4
#define q 1.67e-4

#define k1 3.543e-04
#define k2 7.230e-05
#define k3 1.347e-04

#define ke1 1.6464 
#define ke2 1.3024
#define ke3 0.7503
// 
// #define Ad11 0.5383 
// #define Ad12 0.1033 
// #define Ad13 0.1645
// #define Ad21 0.4132 
// #define Ad22 0.0841 
// #define Ad23 0.1559
// #define Ad31 0.2194 
// #define Ad32 0.0520 
// #define Ad33 0.1279
// 
// #define Bd1 1.0e3*1.7448
// #define Bd2 1.0e3*1.0852
// #define Bd3 1.0e3*0.3976
// 
// #define Cd1 0 
// #define Cd2 0 
// #define Cd3 1


#define MDL_UPDATE

static void mdlUpdate(SimStruct *S, int_T tid)
{
    real_T            tempXk_mu[1] = {1.0};
    real_T            *Xk_mu      = ssGetRealDiscStates(S);
    InputRealPtrsType uPtrs0 = ssGetInputPortRealSignalPtrs(S,0);
    InputRealPtrsType uPtrs1 = ssGetInputPortRealSignalPtrs(S,1);
    real_T  Tm = mxGetPr(ssGetSFcnParam(S,0))[0];
    real_T *yPtrs0 = ssGetOutputPortRealSignal(S,0);

    UNUSED_ARG(tid); /* not used in single tasking mode */
    
    /* INCLUIR AQUÍ LA INICIALIZACIÓN DE LAS MATRICES A, B y C  */
    
    static real_T A[3][3]={{0.5383,0.1033,0.1645},{0.4132, 0.0841, 0.1559},{0.2194, 0.0520, 0.1279}};
 
    static real_T B[3][1]={{1.7448*1000},{1.0852*1000},{0.3976*1000}};
 
    static real_T C[1][3]={0,0,1};

    /* INCLUIR AQUÍ EL OBSERVADOR */
    tempXk_mu[0]=A[0][0]*Xk_mu[0] + A[0][1]*Xk_mu[1] + A[0][2]*Xk_mu[2] + B[0][0]*(Uk[0]*q-qe0)+ke1*(Xk[0]-1-Xk_mu[2]);
    tempXk_mu[1]=A[1][0]*Xk_mu[0] + A[1][1]*Xk_mu[1] + A[1][2]*Xk_mu[2] + B[1][0]*(Uk[0]*q-qe0)+ke2*(Xk[0]-1-Xk_mu[2]);
    tempXk_mu[2]=A[2][0]*Xk_mu[0] + A[2][1]*Xk_mu[1] + A[2][2]*Xk_mu[2] + B[2][0]*(Uk[0]*q-qe0)+ke3*(Xk[0]-1-Xk_mu[2]);
            
    Xk_mu[0]=tempXk_mu[0];
    Xk_mu[1]=tempXk_mu[1];
    Xk_mu[2]=tempXk_mu[2];
}