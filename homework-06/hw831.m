%%% Homework 6, Math 693B
%  Geneva Porter, 23 April 2020
%  Problem 8.3.1 (Strikewerda)
%
% Use the scheme:
%                1/k^2 * [u_m^(n+1) - 2*u_m^n + u_m^(n-1)] = 
%                a^2/h^2 * [u_(m+1)^n - 2*u_m^n +u_(m-1)^n
% to approximate u_(tt) = u_(xx) with:
% 0 <= x <= 1
% 0 <= t <= 1
%
% at x = 1:
% u(t,x) = cos(x+t) + cos(x-t)
%
% at x = 0:
% u_x = 0  -->  u_0^n = u_1^n
%
% Implement the boundary conditions at x = 0:
% (a) u_0^(n+1) = 1/3 * [4*u_1^(n+1) - u_2^(n+1)]
% (b) u_0^(n+1) = 2*u_0^n - u_0^(n-1) - 2*a^2lambda^2*(u_0^n - u_1^n)
% (c) u_0^n = u_1^n
%
% Use h = [1/10 1/20 1/40] and lambda = 1.

problem = 831;
lambda = 1;
hvals = [1/10 1/20 1/40];

for i = 1:length(hvals)
    
    h = hvals(i);
    k = lambda*h;
    t = 0:k:1;
    x = 0:h:1;
    
    solution = wave_equation(k, h, t, x);
    plot_solution(solution, h, t, x, i+3, problem);
end
    

% The plots I produced all look indistinguishible to me. Looking at the
% numerics, I see that the matricies' upper triangular entries are
% identical, which is expected since the only difference is the boundary at
% x = 0 (left side of matrix). The scheme appears stable and accurate in
% each implementation.
    
    
    
    
    
    
    
    
    
    
    