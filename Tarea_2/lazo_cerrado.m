clc;
clear;

%------ DATOS PLANTA -------

omega_n = 7; %frecuencia de corte [5,10]
xi = 0.5; %factor de amortiguamiento [0,sqrt(2)]
K_g = 3; %Ganancia [2,inf[
alfa = 2; %coeficiente 

%------ DATOS CONTROLADOR ------

K_c = 0.0095448; %Tanteado con SISOTOOL
c = -12.22; %Tanteado con SISOTOOL
p = 0; %MATEMATICAMENTE CORRECTO

%------ Datos de entradas -----

r = 2;

%----- ANALISIS SISO-TOOL DE LA PLANTA -------
s = tf ('s');
C = K_c * (s-c)/ (s-p)
G_o = K_g * omega_n^2 * ((-1)*alfa*s + 1) / (s^2 + 2*xi*omega_n*s + omega_n^2)
sisotool(G_o, C)


