function [x] = trisolve(T,b)

[n,m] = size(T);
work = zeros(n,1);
work(1) = T(1,2);
x(1,:) = b(1,:);

% Forward sweep.
for i=2:n
beta = T(i,1)/work(i-1);
x(i,:) = b(i,:) - beta*x(i-1,:);
work(i) = T(i,2) - beta*T(i-1,3);
end
x(n,:) = x(n,:)/work(n);

% Backward sweep.
for i=n-1:-1:1
x(i,:) = (x(i,:) - T(i,3)*x(i+1,:)) / work(i);

end
