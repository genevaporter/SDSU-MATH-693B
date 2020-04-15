function u = implement_scheme(h, lambda, scheme)
%IMPLEMENT_SCHEME 
%   This function implements a finite difference method and returns a
%   matrix of output values for each time step. Each row of the output
%   matrix is a single time step.


    x = -1:h:1;     
    k = lambda*h;
    t = 0:k:1.2;
    u = zeros(length(t), length(x));

    for i = 1:length(t)-1
        
        if i == 1 % this condition creates the first row at time = 0
            u(i,:) = sin(2*pi.*x);
        end 
        
        switch scheme
            
            case 'ftbs'
                for j = 1:length(x)
                    if j == 1 % boundary condition u(t,-1) = 0
                        u(i+1,j) = u(i,j) * (1-lambda) +...
                            u(i,length(x)-1) * (lambda);
                    else
                        u(i+1,j) = u(i,j) * (1-lambda) +...
                            u(i,j-1) * (lambda);
                    end
                end
                
            case 'lw'
                for j = 1:length(x)
                    if j == 1 % boundary condition u(t,-1) = 0
                        u(i+1,j) = u(i,j) * (1 - lambda^2) +...
                             u(i,j+1) * 0.5 * (lambda^2 - lambda) +...
                             u(i,length(x)-1) * 0.5 * (lambda^2 + lambda);
                    elseif j == length(x)
                        u(i+1,j) = u(i,j) * (1 - lambda^2) +...
                             u(i,2) * 0.5 * (lambda^2 - lambda) +...
                             u(i,j-1) * 0.5 * (lambda^2 + lambda);
                    else
                        u(i+1,j) = u(i,j) * (1 - lambda^2) +...
                            u(i,j+1) * 0.5 * (lambda^2 - lambda) +...
                            u(i,j-1) * 0.5 * (lambda^2 + lambda);
                    end
                end
        end 
           
    end 

end



