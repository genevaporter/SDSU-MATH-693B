function errors(solution, k, h, ptitle, figure_number)

    time = 0:k:.5;
    space = -1+h:h:1-h;

    normL2 = zeros(length(time)-1, 1);
    normSp = normL2;

    for i = 1:length(time)-1
        for j = 1:length(space)
            normL2(i) = normL2(i) + (solution(i+1,j) - solution(i,j))^2;
        end
        normL2(i) = sqrt(normL2(i));
        normSp(i) = abs(max(solution(i+1,:)) - min(solution(i,:)));
    end

    figure (figure_number)
    plot(time(2:end), normL2);
    title(["Supremum norm error (" + ptitle + ')']);
    ylabel('||u_{n+1} - u_{n}||_\infty');
    xlabel('t');

    figure (figure_number +1)
    plot(time(2:end), normSp);        
    title(["L2 norm error (" + ptitle + ')']);
    xlabel('||u_{n+1} - u_{n}||_2');
    ylabel('t');
    
end

