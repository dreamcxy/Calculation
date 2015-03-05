function[] = Rayleign(n)
A = generate(n);
k = 1;
u = 10*rand(n,1);
TOL = 10^(-6);
m = 200000;
b = max1(u);
u = u/b;
for k = 1:m
    v = A*u;
    
    w = v/b;
    ERR = norm(u-w,Inf);
    u = w;
    if ERR < TOL && k>=4
        b3
        u
        break;
    end
    k = k+1;
   
end

