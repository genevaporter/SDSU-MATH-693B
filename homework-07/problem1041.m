% Homework 7, problem 10.4.1
% Math 693B, Numerical PDEs
% Professor Udiak George, SDSU
%
% Solve the initial value problem for the heat equation u_t = u_xx on the
% interval [-1, 1] with periodic boundary conditions up to t=1. Use the
% explicit forward-time central-space scheme with mu=0.4 and grid spacing
% h=[1/10,1/20,1/40,1/80], with the following initial functions:
%
%   a) u_0(x) = 1 if |x| < 1/2
%               1/2 if |x| = 1/2
%               0 otherwise
%
%   b) u_0(x) = cos(pi*x)
%
% The exact solution to (a) is given in the text. For t=1 only a few terms
% are needed to give seven-place accuracy. Show that the solution is
% computed to second-order accuracy in the L2 norm.

clear
clc
format long

mu = 0.4;
h_vals = [1/10, 1/20, 1/40, 1/80];
n = 13;

for h_idx = 1:length(h_vals)
    
    h = h_vals(h_idx);
    k = mu*h^2;
    h2k2 = h^2 + k^2;
    
    x = -1:h:1;
    t = 0:k:1;
    
    a_exact = zeros(1,length(x));
    a_solution = zeros(length(t),length(x));
    b_solution = zeros(length(t),length(x));
    
    for j = 1:length(x)
        if abs(x(j)) < 1/2
            a_solution(1,j) = 1;
        elseif abs(x(j)) == 1/2
            a_solution(1,j) = 1/2;
        else
            a_solution(1,j) = 0;
        end
        b_solution(1,j) = cos(pi*x(j));
        
        for m = 0:10
            a_exact(j) = exp(-(2*m+1)^2*pi^2) * ...
                (-1)^m/(2*m+1) * cos((2*m+1)*pi*x(j)) + ...
                a_exact(j);
        end
    end
    
    a_exact = 1/2 + 2/pi*a_exact;
    
    a_solution = forward_t_central_x(x, t, a_solution(1,:));
    b_solution = forward_t_central_x(x, t, b_solution(1,:));
    
    accuracy = sqrt(sum((a_exact - a_solution(end,:)).^2));
    
    disp(["The forward-time, central-space scheme with h = " + ...
        h + " has a local error of " + accuracy + " at t=1."]);
    
    disp("Since " + accuracy + " < h^2 + k^2 = " + h2k2 + ...
        ", this scheme is accurate of order at least 2.");
    
    disp(" ");
    
    a_title = ["Forward Time, Central Space scheme part (a), h = " + h];
    b_title = ["Forward Time, Central Space scheme part (b), h = " + h];
    
    figure(n); n = n+1;
    plot_solutions(x, t, a_solution, a_title);
        
    figure(n); n = n+1;
    plot_solutions(x, t, b_solution, b_title);
    
end


% I'm not sure what happened with the order of accuracy. Everything else
% looked good, I don't know where I made the mistake...







