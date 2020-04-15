function plot_solutions(h, lambda, solution, scheme)

% Plots a surface map of the solution using the given scheme

    tvals = 0:h*lambda:1.2;
    xvals = -1:h:1;
   
    [T,X] = meshgrid(xvals,tvals);

    surf(T,X,solution);
    shading interp;
   
    ylabel('t');
    xlabel('x');
    
    title_info = [" at h = " + h + " and \lambda = " + lambda];
    
    switch scheme
        case 'ftbs'
            title(["Forward time, backwards space" + title_info]);
        case 'lw'
            title(["Lax-Wendroff" + title_info]);
    end
    
end

