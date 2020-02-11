clear
clc

h = [1/10, 1/20, 1/40];
lambda = [0.8, 1.6,];

vfunction = @(t,x) cos(pi*(x-t));

vold = zeros(1,1);
vnew = zeros(1,1);

for i=1:length(h)
    
    time = 0:k:2.4;
    space = -1:h(i):3;
        
    % scheme A: forward time, forward space scheme    
    k1 = lambda(1)*h(i);
    
    % scheme B: forward time, central space scheme   
    k2 = k1; 
    
    % scheme C: Leapfrog scheme   
    k3 = k1;
    
    % scheme D: Lax-Friedrichs scheme    
    k4 = lambda(2)*h(i);

    
end