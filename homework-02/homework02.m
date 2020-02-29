%%% Homework 2, Math 693B, Numerical PDEs
%%% Geneva Porter, SDSU, 2/27/2020

% u(t,0) = 
%
% a) u1(t,0) = 0, u(t,1): u_m^{n+1} = 2u_{m-1}^n+1 - u_{m-2}^{n+1}
% b) u1(t,0) = 0, u(t,1) = 0
% c) u1(t,0) = 0, u(t,1) = 
% d) u1(t,0) = 0, u(t,1) = 

clear
clc

h = 1/50;
lambda = 0.8;
t = 0:lambda*h:3;
s = 0:h:1;

sol1 = leapfrog(lambda, t, s, 'a');
u1 = sol1(:,:,1);
v1 = sol1(:,:,2);
make_movie('a', u1, v1, t, s);

sol2 = leapfrog(lambda, t, s, 'b');
u2 = sol2(:,:,1);
v2 = sol2(:,:,2);
make_movie('b', u2, v2, t, s);

sol3 = leapfrog(lambda, t, s, 'c');
u3 = sol3(:,:,1);
v3 = sol3(:,:,2);
make_movie('c', u3, v3, t, s);

sol4 = leapfrog(lambda, t, s, 'd');
u4 = sol4(:,:,1);
v4 = sol4(:,:,2);
make_movie('d', u4, v4, t, s);
