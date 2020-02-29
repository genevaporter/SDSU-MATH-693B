function solutions = leapfrog(lambda, t, s, scheme)
%leapfrog
%   This function implements a finite difference method and returns a
%   matrix of output values for each time step. Each row of the output
%   matrix is a single time step.

    space = s;     
    time = t;
    u = zeros(length(time), length(space));
    v = zeros(length(time), length(space));
    solutions = zeros(length(time), length(space),2);  
    
    % First 2 rows
    for j = 2:length(space)
        u(1,j) = space(j);
        v(1,j) = 1;
        if j ~= length(space)
            u(2,j) = u(1,j) - 0.5*lambda*(u(1,j+1) - u(1,j-1));
            v(2,j) = u(1,j) - 0.5*lambda*(u(1,j+1) - u(1,j-1));
        else
            u(2,j) = u(1,j-1);
            v(2,j) = v(1,j-1);
        end
    end

    for i = 2:length(time)-1
        for j = 2:length(space)   
            switch scheme
                case 'a' % 
                    if j ~= length(space)
                        u(i+1,j) = u(i-1,j) - lambda*(v(i,j+1) - v(i,j-1));
                        v(i+1,j) = v(i-1,j) - lambda*(u(i,j+1) - u(i,j-1));
                    else
                        u(i+1,j) = 2*u(i,j-1) - u(i,j-2);
                        v(i+1,j) = 2*v(i,j-1) - v(i,j-2);
                    end
                case 'b' % 
                    if j ~= length(space)
                        u(i+1,j) = u(i-1,j) - lambda*(v(i,j+1) - v(i,j-1));
                        v(i+1,j) = v(i-1,j) - lambda*(u(i,j+1) - u(i,j-1));
                    end
                case 'c' % 
                    if j ~= length(space)
                        u(i+1,j) = u(i-1,j) - lambda*(v(i,j+1) - v(i,j-1));
                        v(i+1,j) = v(i-1,j) - lambda*(u(i,j+1) - u(i,j-1));
                    else
                        u(i+1,j) = u(i,j-1);
                        v(i+1,j) = v(i,j-1);
                    end                  
                case 'd' 
                    if j ~= length(space)
                        u(i+1,j) = u(i-1,j) - lambda*(v(i,j+1) - v(i,j-1));
                        v(i+1,j) = v(i-1,j) - lambda*(u(i,j+1) - u(i,j-1));
                    else
                        u(i+1,j) = u(i,j-1);
                        v(i+1,j) = v(i,j-1);
                    end
            end
        end
    end

    solutions(:,:,1) = u;
    solutions(:,:,2) = v;
end


