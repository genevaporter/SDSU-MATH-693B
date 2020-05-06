% Homework 7, problem 10.3.6
% Math 693B, Numerical PDEs
% Professor Udiak George, SDSU
%
% Solve the initial value problems for teh one-way wave equation u_t+u_x=0
% on the interval [-1,1] with periodic boundary conditions up to t=0.96.
% Use the Lax-Wendroff scheme with lambda=0.8 and grid spacing
% h=[1/10,1/20,1/40,1/80]. Use the following initial functions:
%
% a) u_0(x) = 1   if |x| < 1/2
%             1/2 if |x| = 1/2
%             0   otherwise
%
% b) u_0(x) = cos(pi*x)
%
% c) u_0(x) = cos^2(pi*x) if |x| <= 1/2
%             0 otherwise
%
% Determine the rates of convergence of the numerical solution to the exact
% solution as a function of h. COmpare the actual rates of convergence with
% those obtained in this section. Discuss the results. Note that the
% convergence rate obtained for (a) can be quite sensitive to the method of
% programming.

clc
clear

lambda = 0.8;
h_vals = [1/10, 1/20, 1/40, 1/80];
n = 1; % For counting figure numbers

for i = 1:length(h_vals)
    
    h = h_vals(i);
    k = lambda*h;
    t = 0:k:0.96;
    x = -1:h:1;
    
    a_solution = zeros(length(t), length(x));
    b_solution = zeros(length(t), length(x));
    c_solution = zeros(length(t), length(x));  
    
    % Calculating initial values for u_0(x)
    
    for j = 1:length(x)
        if abs(x(j)) < 1/2
            a_solution(1,j) = 1;
            c_solution(1,j) = cos(pi*x(j))^2;
        elseif abs(x(j)) == 1/2
            a_solution(1,j) = 1/2;
            c_solution(1,j) = cos(pi*x(j))^2;
        else
            a_solution(1,j) = 0;
            c_solution(1,j) = 0;
        end
        b_solution(1,j) = cos(pi*x(j));
    end
    
    a_solution = lax_wendroff(x, t, a_solution);
    b_solution = lax_wendroff(x, t, b_solution);
    c_solution = lax_wendroff(x, t, c_solution);
    
    a_title = ["Lax Wendroff scheme part (a), h = " + h];
    b_title = ["Lax Wendroff scheme part (b), h = " + h];
    c_title = ["Lax Wendroff scheme part (c), h = " + h];
    
    figure(n); n = n+1;
    plot_solutions(x, t, a_solution, a_title);
        
    figure(n); n = n+1;
    plot_solutions(x, t, b_solution, b_title);
        
    figure(n); n = n+1;
    plot_solutions(x, t, c_solution, c_title);    
    
end
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    