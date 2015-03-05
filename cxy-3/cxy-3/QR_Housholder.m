 function [x] = QR_Housholder(A,b1)
% A = [1,3;1,3;1,1;1,1];
% b1 = [4;3;3;0];
m = max(size(A));
n = rank(A);
d = zeros(n,1);
A = [A b1];
b = 0;
x = zeros(n,1);
for k = 1:n-1
    delta = norm(A(k:m,k));
    if A(k,k) >= 0
        delta = (-1)*delta;
    end
        h = delta - A(k,k);
        A(k,k) = (-1)*h;
        d(k,1) = delta;
        b = d(k,1)*h;
        for j = k+1:n+1
            sum1 = 0;
            for i = k+1:m
                sum1 = sum1+A(i,k)*A(i,j);
            end
            delta = (A(k,j)*h-sum1)/b;
            A(k,j) = A(k,j) - delta*h;
            for i = k+1:m
                A(i,j) = A(i,j) + delta*A(i,k);
            end
        end
end
if m == n
    d(n,1) = A(n,n);
    A
    d
    A*diag(d)
    return ;
else
    delta = norm(A(n:m,n));
    if A(n,n) >= 0
        d(n,1) = (-1)*delta;
    else
        d(n,1) = delta;
    end
    A(n,n) = A(n,n) - d(n,1);
    b = d(n,1)*A(n,n);
    sum2 = 0;
    for i = n+1:m
        sum2 = sum2+A(i,n)*A(i,n+1);
    end
    delta = (A(n,n+1)*A(n,n)+sum2)/b;
    A(n,n+1) = A(n,n+1)+delta*A(n,n);
    x(n,1) = A(n,n+1)/d(n,1);
    for k = n-1:-1:1
        sum3 = 0;
        for j = k+1:n
            sum3 = sum3+A(k,j)*x(j,1);
        end
        x(k,1) = (A(k,n+1)-sum3)/d(k,1);
        x = x;
    end
end
