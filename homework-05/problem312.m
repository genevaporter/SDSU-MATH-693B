% Geneva Porter, Math 693B, Spring 2020
% Homework 5, Strikwerda problem 3.1.2
%
% Solve u_t + u_x = 0: 
%   -1 <= x <= 1 
% 	0 <= t, <= 1.2
% 	u(o,x) = sin(2*pi*x)
% 	u(t,1) = u(t,-1)
%
% a) Use forward-time backward-space, demonstrate 1st order accuracy
% b) Use Lax-Wendroff, demonstrate 2nd order accuracy 
%
% Use lambda = 0.8 and h=[1/10, 1/20, 1/40, 1/80]. Measure L2 norm error
% and maximum norm error. (given as plots for each figure)

lambda = 0.8;
h = [1/10, 1/20, 1/40, 1/80];


for n = 1:length(h)
    
    solution1 = implement_scheme(h(n), lambda, 'ftbs');
    solution2 = implement_scheme(h(n), lambda, 'lw');
    
    figure(2*n-1)
    clf
    hold on
    subplot(3,1,1); 
        plot_solutions(h(n), lambda, solution1, 'ftbs');
        compute_errors(h(n), lambda, solution1);
    
    figure(2*n)
    clf
    hold on
    subplot(3,1,1); 
        plot_solutions(h(n), lambda, solution2, 'lw');
        compute_errors(h(n), lambda, solution2);
end