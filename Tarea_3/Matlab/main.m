%------------------------ TAREA 3 -----------------------------
%NOTA: Es como se marcan zonas de inter�s directo para quien revise.
clc;
clear;
s = tf ('s');
x = sym('x');
%------ DATOS PLANTA -------
m = 0.7; %masa [kg]
l = 0.75; %largo [m]
cr = 0.05; %constante de roce viscoso [N m s/rad]
J = m*(l^2); %momento de inercia del pendulo
g = 9.81; %Aceleracion de gravedad: [m/s^2]

%G0 = 1/(J*s^2+ s*(cr) - (m*g*l)); %modelo linealizado en (0,pi)
G0 = (1/J)/(s^2+ s*(cr/J) - (m*g*l/J));
%esto funciona para K aprox 14

%------ CONTROLADOR proporcional------
K_p = 5.1503; 
Cp = K_p;
%sisotool(G0, Cp) %NOTA: De aqu� se obtienen las im�genes para (4)

%------ Controlador PD ---------
%cancelaci�n del cero: se determina el cero tal que cancele el polo estable

H = (J*x^2+ x*(cr) - (m*g*l));
eq = solve(H);
c = -1*double(eq(1)); %-1 porque la raiz de la cuadr�tica da la vuelta del signo que se necesita.

K_pd = 14;
p = 10;
Cpd = K_pd * (s+c) / (s+p)
%sisotool(G0, Cpd) %NOTA: De aqu� se obtienen las im�genes para (4.2)

%--------- Agregando el actuador -------
T_d = 0.1;
T_e = 0.1;
K_a = 0.1;
A = K_a * exp(-1*T_d*s) / (T_e*s+1);
%A = K_a / (T_e*s+1);
Gdelta = 1-A;
G = A*G0; %planta real linealizada en (0,pi)

T0 = (G0*Cpd)/(1+G0*Cpd);
%sisotool(G,Cpd)
%bode(T0*Gdelta)

%--------- Corrigiendo el controlador
c2 = 3.681;
p2 = 30;
K_pd_mod = 425;

Cpd_mod = K_pd_mod*(s+c2)/ ...
                   (s+p2);
sisotool(G,Cpd_mod)

