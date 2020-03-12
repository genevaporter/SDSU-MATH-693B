function plotfigures(k, h, solution, title)

time = 0:k:.5;
space = -1:h:1;

[T,X] = meshgrid(time, space);
surf(T,X,solution');

end

