function u = implement_scheme(h, lambda, scheme)
%IMPLEMENT_SCHEME 
%   This function implements a finite difference method and returns a
%   matrix of output values for each time step. Each row of the output
%   matrix is a single time step.


    space = -1:h:3;     
    k = lambda*h;
    t = 0:k:2.4;
    u = zeros(length(t), length(space));

    for i = 1:length(t)
        if i == 1 % this condition creates the first row at time = 0
            for j = 1:length(space)
                if abs(space(j)) <= 0.5
                    u(i,j) = (cos(pi*(space(j)))).^2;
                else
                    u(i,j) = 0;
                end
            end
        else % this condition uses the scheme for the rest of the rows
            for j = 1:length(space)
                if j == 1 % boundary condition u(t,-1) = 0
                    u(i,j) = 0;
                else
                    switch scheme
                        case 'a' % Forward time, backward space
                                u(i,j) = u(i-1,j)*(1-lambda) + ...
                                         u(i-1, j-1)*lambda;
                        case 'b' % Forward time, central space
                            if j ~= length(space) 
                                u(i,j) = u(i-1,j) - ...
                                         u(i-1,j+1)*0.5*lambda + ...
                                         u(i-1,j-1)*0.5*lambda;
                            else 
                                u(i,j) = u(i,j-1);
                            end
                        case 'c' % Lax-Friedrichs
                            if j ~= length(space)
                                u(i,j) = u(i-1,j+1)*0.5*(1-lambda) + ...
                                         u(i-1,j-1)*0.5*(1+lambda);
                            else
                                u(i,j) = u(i,j-1);
                            end
                        case 'd' % Leapfrog
                            if j ~= length(space)
                                if i==2
                                    u(i,j) = u(i-1,j) - ...
                                             u(i-1,j+1)*0.5*lambda + ...
                                             u(i-1,j-1)*0.5*lambda;
                                else
                                u(i,j) = u(i-2,j) - ...
                                         u(i-1,j+1)*lambda + ...
                                         u(i-1,j-1)*lambda;
                                end
                            else 
                                u(i,j) = u(i,j-1);
                            end
                        case 'exact'
                            if abs(space(j)-t(i)) <= 0.5
                                u(i,j) = (cos(pi*(space(j)-t(i)))).^2;
                            else
                                u(i,j) = 0;
                            end
                    end
                end
            end 
        end
    end

end

