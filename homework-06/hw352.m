%%% Homework 6, Math 693B
%  Geneva Porter, 23 April 2020
%  Problem 3.5.2 (Strikewerda)

% Solve u_t + u_x + u = 0 with the following conditions:
% Crank-Nicolson Scheme
% Thomas algorithm
% -1 <= x <= 1
% 0 <= t <= 1
% lambda = 1.0, h = [1/10, 1/20, 1/40];
%
% use boundary values:
% (a) u(t,-1) = exp^(-t)*sin(pi*(x-t))
% (b) u(t,-1) = max(0, exp^(-t)*cos(pi*(x-t)))
% 
% and:
% (c) u_m^(n+1)-u_m^n+lambda*(u_m^(n+1)-u_(m-1)^(n+1)) + k*u_m^(n+1) = 0
% (d) u_m^(n+1) = 2*u_(m-1)^(n+1) - u_(m-2)^(n+1)
% where m is the grid index where x = 1.
%
% Comment on the accuracy of the method

problem = 352;
lambda = .5;
h_vals = [1/10 1/20 1/40];

for i = 1:length(h_vals)
    
    h = h_vals(i);
    k = h*lambda;
    x = -1:h:1;
    t = 0:k:2;
    
    solution = crank_nicolson_thomas(k, h, t, x);
    
    plot_solution(solution, h, t, x, i, problem);
    
end

% This method seems reasonably accurate. I noticed that when the (a)
% boundary at x = 1 was used, there was less stability in the system, as
% shown in the figures by some ripples. Using the (b) boundary condition at
% x = 1 gave a much smoother, more stable visualization. Could the (b)
% boundary condition at x = 1 be closer to the exact solution? The Crank-
% Nicolson scheme has second-order accuracy in both time and space. Since
% this problem does not ask me to find the exact solution, there is not
% much else to say about how accurate these approximations are.
