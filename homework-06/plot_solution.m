function plot_solution(solution, h, t, x, i)

figure(i)
clf
hold on

titleval = ["Initial value (a), end boundary (a), h = " + h;
            "Initial value (a), end boundary (b), h = " + h;
            "Initial value (b), end boundary (a), h = " + h;
            "Initial value (b), end boundary (b), h = " + h];

[X,T] = meshgrid(x,t);

for i = 1:4
    
    subplot(4,1,i)
        surf(X,T, solution(:,:,i));
        xlabel('x');
        ylabel('t');
        title(titleval(i));

end

end

