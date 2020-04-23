function solution = wave_equation(k, h, t, x)

    lambda = k/h;
    N = length(t);
    M = length(x);

    solution = zeros(N,M,3);

    for type = 1:3
        
        solution(1,:,type) = 2*cos(x);
        solution(2,:,type) = cos(x+t(2)) + cos(x-t(2)); % book typo on BC?
        solution(:,M,type) = cos(1+t) + cos(1-t);        
        
        for n = 2:N-1
            
            for m = 2:M-1
                solution(n+1,m,type) = ...
                    solution(n,m-1,type) * lambda^2 + ...
                    solution(n,m,type)   * (2-2*lambda^2)+ ...
                    solution(n,m+1,type) * lambda^2 - ...
                    solution(n-1,m,type);
            end
            
            if type == 1
                solution(n+1,1,type) = 1/3 * ...
                    (4*solution(n+1,2,type) - solution(n+1,3,type));
            elseif type == 2
                solution(n+1,1,type) = 2*solution(n,1,type) - ...
                    solution(n-1,1,type) - 2*lambda^2*...
                    (solution(n,1,type) - solution(n,2,type));
            else
                solution(n+1,1,type) = solution(n+1,2,type);
            end
            
        end
    end
    
    
    
    
    
end














