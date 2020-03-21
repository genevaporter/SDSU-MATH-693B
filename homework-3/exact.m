function solution = exact(k,h)

% Returns the analytic solution to the heat equation with specific 
% boundary and initial conditions.

time = 0:k:.5;
space = -1+h:h:1-h;

solution = zeros(length(time),length(space));

% Exact solution
for i = 1:length(time)
    for j = 1: length(space)
        u =@(a) (-1)^a * (cos(pi*(2*a+1)*space(j)))/(pi*(2*a+1)) * ...
            exp(-pi^2*(2*a+1)^2*time(i));
        for a = 0:100
            solution(i,j) = solution(i,j) + 2*u(a);
        end
        solution(i,j) = solution(i,j) + 0.5;
    end
end


end

