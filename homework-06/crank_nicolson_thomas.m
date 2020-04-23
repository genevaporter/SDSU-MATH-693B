function solution = crank_nicolson_thomas(k, h, t, x)

N = length(t);
M = length(x);
lambda = k/h;


a = -lambda/4;
b = 1+k/2;
c = lambda/4;
d = zeros(1,M);

solution = zeros(N,M,4);
u0 = zeros(1,M);
ui = zeros(1,M);

for n = 1:N-1
    for type = 1:4        

        if type == 1 || type == 2
            if n == 1
                solution(n,:,type) = sin(pi*x);   
            else
                solution(n,1,type) = exp(-t(n))*sin(pi*(x(1)-t(n)));
            end  
        else
            if n == 1
                for m = 1:M
                    solution(1,m,type) = max(0, cos(pi*x(m)));
                end   
            else
                solution(n,1,type) = max(0, exp(-t(n))*cos(pi*(x(1)-t(n))));
            end
        end
        
        u0 = solution(n,:,type);
        
        d(1) = (1-k/2)*u0(1) - lambda/4*u0(2);
        for m = 2:M-1
            d(m) = lambda/4*u0(m-1) + (1-k/2)*u0(m) - lambda/4*u0(m+1);
        end
        d(M) = lambda/4*u0(M-1) + (1-k/2)*u0(M);

        ai = zeros(1,M);
        bi = zeros(1,M);   bi(1) = b;
        di = zeros(1,M);   di(1) = d(1);

        for m = 2:M
            ai(m) = a/bi(m-1);
            bi(m) = b - a/bi(m-1)*c;
            di(m) = d(m) - ai(m)*di(m-1);
        end
        
        ui(M) = di(M) / bi(M);
        for m = 1:M-1
            ui(M-m) = (di(M-m)-c*ui(M-m+1)) / bi(M-m);
        end
        
        solution(n+1,:,type) = ui;
       
        if type == 1 || type == 3
            solution(n+1,M,type) = 1/(1+lambda+k)*u0(M) + ui(M-1);
        else
            solution(n+1,M,type) = 2*ui(M-1) - ui(M-2);
        end
        
    end
end






end

















