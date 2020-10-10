clc
clear

%---DATOS---
m=0.75; %masa
l=0.5; %largo cuerda
C=0.5; %Constante de roze vizcoso
g=9.81; %Aceleración de gravedad:
J=m*l^2; %J

%---SIMULINK---
%open pendulo

%---BODE---
s = tf('s'); %para usar la s mas piola
FT_estable = 1/(J*s^2+ C*s + m*g*l);  %(0,0)
FT_inestable = 1/(J*s^2+ C*s - m*g*l); %(0,pi)
%ltiview('bode',FT_estable, FT_inestable)
h = bodeplot(FT_estable,FT_inestable)

%Customize the plot
p = bodeoptions
set(findall(gcf,'type','line'),'linewidth',2) %codigo random de internet pero funciona
p.Grid = 'On'
setoptions(h,p)