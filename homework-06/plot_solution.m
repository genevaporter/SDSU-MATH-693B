function plot_solution(solution, h, t, x, i, problem)

figure(i)
clf
hold on

if problem == 352
    titleval = ["Initial value (a), end boundary (a), h = " + h;
                "Initial value (a), end boundary (b), h = " + h;
                "Initial value (b), end boundary (a), h = " + h;
                "Initial value (b), end boundary (b), h = " + h];
elseif problem == 831
    titleval = ["Boundary (a) for x = 0, h = " + h;
                "Boundary (b) for x = 0, h = " + h;
                "Boundary (c) for x = 0, h = " + h];
end

[X,T] = meshgrid(x,t);

for j = 1:length(titleval)
    
    subplot(length(titleval),1,j)
        surf(X,T, solution(:,:,j));
        xlabel('x');
        ylabel('t');
        title(titleval(j));

end

end

