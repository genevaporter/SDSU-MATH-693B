function solution = cranknicolson(k, h, exact)

time = 0:k:.5;
space = -1:h:1;

mu = k/(h^2);

solution = zeros(length(time),length(space));

A = zeros(length(space)-2);
B = zeros(length(space)-2, 1);

% Setting up boundary conditions
solution(:,1) = exact(:,1);
solution(:,end) = exact(:,end);

% Setting up initial conditions
for j = 1:length(space)
    boundary = abs(space(j));
    if boundary < 0.5
        solution(1,j) = 1;
    elseif boundary == 0.5
        solution(1,j) = .5;
    else
        solution(1,j) = 0;
    end
end


% Executing crank-nicolson using inverse matricies

for i = 1:length(time)-1
    
    for j = 2:length(space)-1 
        A(j, j) = 1 + mu;
        
        if j > 1
            A(j,j-1)= -mu/2;
        end
        
        if j < length(space)
            A(j,j+1)= -mu/2;
        end
        
        B(j) = (1 - mu)*solution(i ,j) ... 
             + (mu/2)*solution(i, j-1)...
             + (mu/2)*solution(i, j+1);
    end
    
    x = A \ B;
    solution(i+1, 2:end-1) = x(2:end-1)';
    
end


% Executing crank-nicolson using Thomas algorithm

% ai = -mu/2;
% bi = 1+mu;
% ci = -mu/2;
% 
% c_star = zeros(length(space)-1);
% d_star = c_star;
% 
% k = length(space);
%
% for i = 1:length(time)-1
%     for j = 1:k-1
%         if j ==1
%             di = (1-mu) * solution(i, j) + ...
%                  mu / 2 * solution(i, j+1);
%             c_star(j) = ci/bi;
%             d_star(j) = di/bi;
%         else        
%             di = mu / 2 * solution(i,j-1) + ...
%                  (1-mu) * solution(i, j) + ...
%                  mu / 2 * solution(i, j+1);
%             c_star(j) = ci / (bi - c_star(j-1)*ai);
%             d_star(j) = (di - d_star(j-1)*ai) / (bi - c_star(j-1)*ai);
%         end
%     end
%     
%     for x = 0:k-1
%         if x == 0
%             solution(i+1,k-x) = d_star(k);
%         else
%             solution(i+1,k-x) = d_star(k-x) - c_star(k-x)*solution(i+1,k-x+1);
%         end
%     end
%     
% end


% Supremum norm

% L2 norm

end

