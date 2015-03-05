function [wucha] = E6112(m)
n = m*m;
A = 4*ones(1,m);
B = (-1)*ones(1,m-1);
T = diag(A)+diag(B,1)+diag(B,-1);
I = (-1)*eye(m);
a = blkdiag(kron(eye(m),T))+kron(diag(ones(1,m-1),1),I)+kron(diag(ones(1,m-1),-1),I);
x = ones(n,1);
b = a*x;
y = zeros(n,1);
g = zeros(n,1);
%t0 = cputime;
if a(1,1) == 0
    disp('Method Failed');
end
g(1) = a(2,1);
a(2,1) = g(1)/a(1,1);
a(2,2) = a(2,2)-g(1)*a(2,1);
if a(2,2) == 0
    disp('Method Failed');
end
for i = 3:n
    g(1) = a(i,1);
    for j = 2:n-1
        summ = 0;
        for k = 2:j-1
            summ = summ + g(k)*a(j,k);
        end
        g(j) = a(i,j) - summ;       
    end
    a(i,1) = g(1)/a(1,1);
    for j = 2:i-1
        a(i,j) = g(j)/a(j,j);
    end
    summ = 0;
    for k = 1:i-1
        summ = summ + g(k)*a(j,k);
    end
    a(i,i) = a(i,i) - summ;
    if a(i,i) == 0
        disp('Method Failed');
    end
end
for i = 2:n
    summ = 0;
    for k = 1:i-1
        summ = summ+a(i,k)*b(k);
    end
    y(i) = b(i) - summ;
end
for i = 2:n
    b(i) = y(i);
end
x(n) = b(n)/a(n,n);
for i = n-1:-1:1
    summ = 0;
    for k = i+1:n
        summ = summ+a(k,i)*x(k);
    end
    x(i) = b(i)/a(i,i) - summ;
end
wucha = log(max(max(abs(x-ones(n,1)))))
%t1 = cputime;
end