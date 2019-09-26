%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%% PROGRAMA GENERAL DEL PROYECTO DE F. ROBÓTICA (JAVI GÓMEZ) %%%%%%
%%%%%%%%%%%% SE RECOMIENDA CORRER EL PROGRAMA POR APARTADOS %%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% RESETEAMOS LA MEMORIA
close all
clear all

%% INCLUIMOS EL TOOLBOX Y LIMPIAMOS LA PANTALLA
startup_rvc;
clc

%% ROBOT 6DOF (Robot completo)
CINEMATICA_6DOF;

%% INCLUIMOS LA CINEMÁTICA DEL ROBOT Y EL MODELO (Solo brazo a partir de ahora)
CINEMATICA; % Está comentada la parte de los jacobianos y la trayectoria circular

%% INCLUIMOS LA DINÁMICA DEL ROBOT
DINAMICA; % Está comentada la comparación

%% REALIZAMOS EL CONTROL CINEMÁTICO (GENERADOR DE TRAYECTORIAS)
CONTROL_CINEMATICO; 

%% REALIZAMOS EL CONTROL DINÁMICO (VARIOS MODOS POSIBLES, CONFIGURAR CONTROLADOR)
CONTROL_DINAMICO;

