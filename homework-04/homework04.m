%%% Homework 4, Math 693B, Numerical PDEs
%%% Geneva Porter, SDSU, 4/9/2020

clear
clc

h = 1/20;
lambda = 1/2;


    
% Lax-Friedrichs scheme
solution = implement_scheme(h,lambda);
plot_solution(h,lambda,solution);
