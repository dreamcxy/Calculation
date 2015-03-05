function [] = Aitken(n)
A = generate(n);
k = 1;
u = 10*rand(n,1);
b0 = 0;
b1 = 0;
TOL = 10^(-6);
m = 200000;
b = max1(u);
u = u/b;
for k = 1:m
    v = A*u;
    b = max1(u);
    b3 = b0 - power((b1-b0),2)/(b - 2*b1+b0);
    w = v/b;
    ERR = norm(u-w,Inf);
    u = w;
    if ERR < TOL && k>=4
        b3
        u
        break;
    end
    k = k+1;
    b0 = b1;
    b1 = b;
end
end