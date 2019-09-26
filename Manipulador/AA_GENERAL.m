%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%% PROGRAMA GENERAL DEL PROYECTO DE F. ROB�TICA (JAVI G�MEZ) %%%%%%
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

%% INCLUIMOS LA CINEM�TICA DEL ROBOT Y EL MODELO (Solo brazo a partir de ahora)
CINEMATICA; % Est� comentada la parte de los jacobianos y la trayectoria circular

%% INCLUIMOS LA DIN�MICA DEL ROBOT
DINAMICA; % Est� comentada la comparaci�n

%% REALIZAMOS EL CONTROL CINEM�TICO (GENERADOR DE TRAYECTORIAS)
CONTROL_CINEMATICO; 

%% REALIZAMOS EL CONTROL DIN�MICO (VARIOS MODOS POSIBLES, CONFIGURAR CONTROLADOR)
CONTROL_DINAMICO;

