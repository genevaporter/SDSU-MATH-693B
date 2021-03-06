function solution = implement_scheme_LF(h, lambda)
%IMPLEMENT_SCHEME 
%   This function implements a finite difference method and returns a
%   matrix of output values for each time step. Each row of the output
%   matrix is a single time step.


    space = -3:h:3;  
    k = lambda*h;
    t = 0:k:2;
    u = zeros(length(t), length(space));
    w = zeros(length(t), length(space));

    for i = 1:length(t)-2
        if i == 1 % initial condition
            for j = 1:length(space)
                u(i,j) = max(0,1-abs(space(j)));
                w(i,j) = max(0,1-2*abs(space(j)));
            end
        end
        % this condition uses the scheme for the rest of the rows
        for j = 1:length(space)
            if j ~= 1 && j ~= length(space)                                          
                u(i+1,j) = 0.5*(u(i,j+1) + u(i,j-1)) -...
                    lambda/6*(t(i)-2)*(u(i,j+1) - u(i,j-1)) - ...
                    lambda/3*(t(i)+1)*(w(i,j+1)-w(i,j-1)) - ...
                    k/3*u(i,j);
                w(i+1,j) =  0.5*(w(i,j+1) + w(i,j-1)) - ...
                    lambda/6*(2*t(i)-1)*(w(i,j+1) - w(i,j-1)) - ...
                    lambda/6*(t(i)+1)*(u(i,j+1)-u(i,j-1)) + ...
                    k/3*w(i,j);
            elseif j == 1 % boundary condition 
                u(i+1,j) = 0;
                w(i+1,j) = u(i+1,j+1);
            elseif j == length(space)
                u(i+1,j) = 0;
                w(i+1,j) = u(i+1, j-1);                

            end
        end
    end
    
    solution = zeros(length(t), length(space),2);
    solution(:,:,1) = u;
    solution(:,:,2) = w;

end

