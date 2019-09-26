/* DIRECTIVAS DE TIPO #define */
#define h10 2.48
#define h20 1.97
#define h30 1
#define qe0 8.35e-4
#define k21 0.487e-3
#define k22 0.112e-3
#define k23 0.261e-3
#define k1 1.695e-3

// #define MDL_UPDATE
// 
// static void mdlUpdate(SimStruct *S, int_T tid)
// {
//     real_T            tempV[0] = {0.0};
//     real_T            *v      = ssGetRealDiscStates(S);
//     InputRealPtrsType uPtrs1 = ssGetInputPortRealSignalPtrs(S,1);
//     InputRealPtrsType uPtrs0 = ssGetInputPortRealSignalPtrs(S,0);
//     real_T  Tm = mxGetPr(ssGetSFcnParam(S,0))[0];
// 
//     UNUSED_ARG(tid); /* not used in single tasking mode */
// 
//     /* INCLUIR AQUÍ v(k+1)=v(k)+err(k) */
//     tempV[0]=...;
//     v[0]=...;
// }