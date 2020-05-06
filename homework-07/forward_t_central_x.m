function u = forward_t_central_x(x, t, u)

    mu = 0.4;
    
    for i = 1:length(t)-1
        for j = 1:length(x)
            
            if j==1 % Periodic boundary condition at x = -1
                u(i+1,j) =  u(i,j)* (1-2*mu)+...
                            u(i,end)* mu + ...
                            u(i,j+1)* mu;
            elseif j ==length(x) % Periodic boundary condition at x = 1
                u(i+1,j) =  u(i,j)* (1-2*mu)+...
                            u(i,j-1)* mu + ...
                            u(i,1)* mu;
            else
                u(i+1,j) =  u(i,j)* (1-2*mu)+...
                            u(i,j-1)* mu + ...
                            u(i,j+1)* mu;
            end
            
        end
    end

end

