function norm = maxnorm(h, lambda, solution)

%MAXNORM Calculates the Maximum norm for a matrix
    tvals = 0:h*lambda:1.2;
    norm = 0;

    for i=1:length(tvals)
        norm = norm + abs(max(solution(i,:)))^2;
    end
    
    norm = sqrt(norm);

end

