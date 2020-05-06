function plot_solutions(x, t, solution, title_val)

[X,T] = meshgrid(x,t);

        surf(X,T, solution);
        hold on;
        xlabel('x');
        ylabel('t');
        title(title_val);

end

