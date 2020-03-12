% page 4 and 7 of lecture 8

clc
clear all

alambda = 1;
theta = [-pi:0.01:pi];


a = 0.5*(3 + 2*i*alambda.*sin(theta));
b = -2;
c = 0.5;
g_plus= (-b+sqrt(b.^2-4*a*c))./(2.*a);
g_minus= (-b-sqrt(b.^2-4*a*c))./(2.*a);
 
plot(real(g_minus),imag(g_minus),'*')

hold on
plot(real(g_plus),imag(g_plus),'*')

% Plot of unit circle
x = cos(theta);
y = sin(theta);
 plot(cos(theta), sin(theta))

% Plot of origin (0,0)
m=0;
n=0;

plot(m,n,'*k')