function[wucha] = E6142(n)
d = zeros(n,1);
x1 = zeros(n,1);
a = 2*ones(1,n);
b = (-1)*ones(1,n-1);
c = (-1)*ones(1,n-1);
T = diag(a)+diag(b,1)+diag(c,-1);  %矩阵T的值
for i = 1:n
    d(i) = 2^(-i);
end
D = diag(d);  %矩阵D的值
for i = 1:n
    x1(i) = i;
end
% size(T)
% size(D)
A = D*T;
b = A*x1;
b = D\b;
d = diag(T);
a = diag(T,-1);
c = diag(T,1);
if d(1) == 0
    disp('Method Failed');
end
p = zeros(n,1);
q = zeros(n,1);
y = zeros(n,1);
p(1) = d(1);
q(1) = c(1)/d(1);
for k = 2:n-1
    p(k) = d(k)- a(k-1)*q(k-1);
    if p(k) == 0
        disp('Method Failed');
    end
    q(k) = c(k)/p(k);
end
p(n) = d(n)-a(n-1)*q(n-1);
if p(n) == 0
    disp('Mehtod Failed');
end
y(1) = b(1)/p(1);
for k = 2:n
    y(k) = (b(k)-a(k-1)*y(k-1))/p(k);
end
x(n) = y(n);
for k = n-1:-1:1
    x(k) = y(k)- q(k)*x(k+1);
end
wucha = log(max(max(abs((x'-x1)))))
end
