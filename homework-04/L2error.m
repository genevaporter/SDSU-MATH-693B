function error = L2error(h,lambda, u)

%L2ERROR Calculates the L2 norm for a matrix

tvals = 0:h*lambda:1.2;
xvals = 0:h:1;
error = 0;

for i=length(tvals)-1
    for j=length(xvals)-1
        error = error + abs(u(i,j) - u(i+1,j+1)).^2;
    end
end
        

error = sqrt(h*error);


end