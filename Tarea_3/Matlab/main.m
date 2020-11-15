%------------------------ TAREA 3 -----------------------------
%NOTA: Es como se marcan zonas de interés directo para quien revise.

clc;
clear;
s = tf ('s');

%------ DATOS PLANTA -------
m = 0.7; %masa [kg]
l = 0.75; %largo [m]
cr = 0.05; %constante de roce viscoso [N m s/rad]
J = m*(l^2); %momento de inercia del pendulo
g = 9.81; %Aceleracion de gravedad: [m/s^2]

G0 = 1/(J*s^2+ cr*s - m*g*l); %modelo linealizado en (0,pi)

%------ CONTROLADOR proporcional------
K_p = 5.1503; 
Cp = K_p;
%sisotool(G0, Cp) %NOTA: De aquí se obtienen las imágenes para (4)

%------ Controlador PD ---------
%cancelación del cero: se determina el cero tal que cancele el polo estable
x = sym('x');
H = J*x^2+ cr*x - m*g*l;
eq = solve(H);
c = -1*double(eq(1)); %-1 porque la raiz de la cuadrática da la vuelta del signo que se necesita.

K_pd = 40;
p = 10;
Cpd = K_pd * (s+c) / (s+p);
%sisotool(G0, Cpd)
