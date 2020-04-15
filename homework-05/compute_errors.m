function compute_errors(lambda, h, solution)

    time = 0:lambda*h:1.2;
    space = -1:h:1;

    normL2 = zeros(length(time)-1, 1);
    normSp = normL2;

    for i = 1:length(time)-1
        for j = 1:length(space)
            normL2(i) = normL2(i) + (solution(i+1,j) - solution(i,j))^2;
        end
        normL2(i) = sqrt(normL2(i));
        normSp(i) = abs(max(solution(i+1,:)) - min(solution(i,:)));
    end

    subplot(3,1,2)
    plot(time(2:end), normL2);
    title("Supremum norm error");
    ylabel('||u_{n+1} - u_{n}||_\infty');
    xlabel('t');

    subplot(3,1,3)
    plot(time(2:end), normSp);        
    title("L2 norm error");
    ylabel('||u_{n+1} - u_{n}||_2');
    xlabel('t');
    
end


