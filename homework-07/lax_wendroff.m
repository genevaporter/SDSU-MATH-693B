function u = lax_wendroff(x, t, u)

    lambda = 0.8;

    for i = 1:length(t)-1
        for j = 1:length(x)
            if j == 1 % periodic boundary condition u(t,-1)
                u(i+1,j) = u(i,j) * (1 - lambda^2) +...
                     u(i,j+1) * 0.5 * (lambda^2 - lambda) +...
                     u(i,end) * 0.5 * (lambda^2 + lambda);
            elseif j == length(x) % periodic boundary condition u(t,1)
                u(i+1,j) = u(i,j) * (1 - lambda^2) +...
                     u(i,1) * 0.5 * (lambda^2 - lambda) +...
                     u(i,j-1) * 0.5 * (lambda^2 + lambda);
            else
                u(i+1,j) = u(i,j) * (1 - lambda^2) +...
                    u(i,j+1) * 0.5 * (lambda^2 - lambda) +...
                    u(i,j-1) * 0.5 * (lambda^2 + lambda);
            end
        end
    end
end

