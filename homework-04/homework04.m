%%% Homework 4, Math 693B, Numerical PDEs
%%% Geneva Porter, SDSU, 4/9/2020

% Problem 1.3.2: solve a 2-valued system using the Lax-Friedrichs scheme.
% This problem is solved using the functions implement_scheme_LF.m and
% plot_solution.m.
% 
% Problem 3.2.4: solve the one-way wave equation using the box scheme.
% Compute the L2 and max error norms.
% This problem uses the functions implement_scheme_BX.m, plot_solutions.m,
% L@error.m, and maxnorm.m.
    
% Problem 1.3.2 Lax-Friedrichs scheme
h = 1/20;
lambda = 1/2;
tvals = 0:lambda*h:2;
xvals = -3:h:3;
solution = implement_scheme_LF(h,lambda);

figure(1)
clf
axes;  

subplot(2,1,1)
plot_solution(tvals,xvals,solution(:,:,1));
shading interp
zlabel('u(t,x)');

subplot(2,1,2)
plot_solution(tvals,xvals,solution(:,:,2));
shading interp
zlabel('w(t,x)');

% Problem 3.2.4 Box scheme
h = [1/10, 1/20, 1/40, 1/80];
lambda = 1.2;

for i = 1:length(h)    
    tvals = 0:lambda*h(i):1.2;
    xvals = 0:h(i):1;
    solutions_h = zeros(length(tvals),length(xvals));
    solutions_h(:,:) = implement_scheme_BX(h(i),lambda);
    figure(i+1)
    clf
    plot_solution(tvals,xvals,solutions_h(:,:));
    zlabel('u(t,x)');
    
    % L2 error
    error = L2error(h(i), lambda, solutions_h);
    disp(["The L2 error for h = " + h(i)+  " is " + error]);
    
    % Max norm
    norm = maxnorm(h(i), lambda, solutions_h);
    disp(["The max norm for h = " + h(i)+  " is " + norm]);
end

