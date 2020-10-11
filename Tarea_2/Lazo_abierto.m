clc;
clear;
%------ DATOS PLANTA -------

omega_n = 7; %frecuencia de corte [5,10]
xi = 0.5; %factor de amortiguamiento [0,sqrt(2)]
K_g = 3; %Ganancia [2,inf[
alfa = 2; %coeficiente 

%----- DATOS CONTROLADOR ------

Limite_u = 4.5; %maximo 5
K_c = omega_n^2 * K_g;
Tau = sqrt(1/(Limite_u * K_c));

%----- DATOS PERTURBACION DE SALIDA -----

Per_A = 0.1;
Per_freq = 5;

%---- SIMULACION -----

open("controlador_lazo_abierto.slx")
