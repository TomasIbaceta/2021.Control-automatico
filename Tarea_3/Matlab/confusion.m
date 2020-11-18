clc
clear

s = tf ('s');
x = sym('x');

m = 0.7; 
l = 0.75; 
cr = 0.05; 
J = m*(l^2); 
g = 9.81; 
%-------------------

G_delta = 
G0 = J/(s^2+ (cr/J)*s - (m*g*l)/J); %modelo linealizado en (0,pi) 
H = (x^2+ (cr/J)*x - (m*g*l)/J);
p = double(solve(H==0))
G0_2 = J/((s-p(1))*(s-p(2)));

bode(G0)
hold on
bode(G0_2)