function plot_solution(tvals, xvals, solution)
%MAKE_MOVIE Summary of this function goes here
%   Detailed explanation goes here
   
    [T,X] = meshgrid(xvals,tvals);

    surf(T,X,solution);
   
    ylabel('t');
    xlabel('x');

    
end
