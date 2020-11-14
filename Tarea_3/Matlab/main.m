%------------------------ TAREA 3 -----------------------------
clc;
clear;
s = tf ('s');

%------ DATOS PLANTA -------
m = 0.7; %masa [kg]
l = 0.75; %largo [m]
C = 0.05; %constante de roce viscoso [N m s/rad]
J = m*(l^2); %momento de inercia del pendulo
g = 9.81; %Aceleracion de gravedad: [m/s^2]

G0 = 1/(J*s^2+ C*s - m*g*l); %modelo linealizado en (0,pi)

%------ CONTROLADOR proporcional------
K_p = 1; 
Cp = K_p;
%sisotool(G0, Cp)

%------ Controlador PD ---------
t_d = 1; %T?
tau_d = 1; %Tau?
K_pd = 1+(t_d/tau_d);
c = 1/(tau_d+t_d);
p = 1/tau_d;
Cpd = K_pd * (s+c) / (s+p);
sisotool(G0, Cpd)
