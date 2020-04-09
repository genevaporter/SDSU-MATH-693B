function solution = implement_scheme_BX(h, lambda)

%IMPLEMENT_SCHEME 
%   This function implements the box scheme FDM and returns a
%   matrix of output values for each time step. Each row of the output
%   matrix is a single time step.


    x = 0:h:1;  
    k = lambda*h;
    t = 0:k:1.2;
    u = zeros(length(t), length(x));
    f =@(x,t) sin(x-t);
    
    for n = 1:length(t)
        u(n,1) = -(1+t(n))*sin(t(n));
    end

    for n = 1:length(t)-1
        if n == 1 % initial condition
            for m = 1:length(x)
                u(n,m) = sin(x(m));
            end
        end
        % this condition uses the scheme for the rest of the rows
        for m = 1:length(x)-1                                         
            u(n+1,m+1) = 1/(1+lambda)*( ...
                0.5*k*(f(x(m+1),t(n+1)) + f(x(m),t(n+1)) + ...
                f(x(m+1),t(n)) + f(x(m),t(n))) - ...
                lambda*(-u(n+1,m) + u(n,m+1)-u(n,m)) - ...
                (u(n+1,m)-u(n,m)-u(n,m+1)));
        end
    end
    
    solution = zeros(length(t), length(x));
    solution(:,:) = u;
end

