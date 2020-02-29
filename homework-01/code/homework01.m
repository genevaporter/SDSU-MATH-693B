%%% Homework 1, Math 693B, Numerical PDEs
%%% Geneva Porter, SDSU, 2/13/2020

clear
clc

h = [1/10, 1/20, 1/40];
lambda = [0.8, 1.6,];

for i=1:length(h)
    
    % Forward time, backward space scheme
    %u1 = implement_scheme(h(i),lambda(1),'a');
    %v1 = implement_scheme(h(i),lambda(1),'exact');
    %make_movie(h(i),lambda(1),'a', u1, v1);
    
    % Forward time, central space scheme
    %u2 = implement_scheme(h(i),lambda(1),'b');
    %make_movie(h(i),lambda(1),'b', u2, v1);
    
    % Lax-Friedrichs scheme
    u3 = implement_scheme(h(i),lambda(2),'c');
    v3 = implement_scheme(h(i),lambda(2),'exact');
    make_movie(h(i),lambda(2),'c', u3, v3);
    
    % Leapfrog scheme
    %u4 = implement_scheme(h(i),lambda(1),'d');
    %make_movie(h(i),lambda(1),'d', u4, v1);
    %
end