function plotfigures(k, h, solution, ptitle)

% Plots the given solution mesh grid as a surface contour.

time = 0:k:.5;
space = -1+h:h:1-h;

[T,X] = meshgrid(time, space);
surf(T,X,solution');

title(ptitle);
xlabel('t');
ylabel('x');
zlabel('u(t,x)');
    
end

