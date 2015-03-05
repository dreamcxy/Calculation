%下面是法方程组法解最小二乘解
function [x] = NE(A,b)
%A为系数矩阵，b为解
[m1,n1] = size(A);
m = max(m1,n1);
n = min(m1,n1);
c = zeros(n,n);
d = zeros(n,1);
y = zeros(n,1);
x = zeros(n,1);
for i = 1:n
    for j = 1:i
        c(i,j) = 0;
        for k = 1:m
            c(i,j) = c(i,j)+A(k,j)*A(k,i);
        end
    end
    for k = 1:m
        d(i,1) = d(i,1) + A(k,i)*b(k,1);
    end
end
L = chol(c,'lower');%计算c的cholesky分解
y = inv(L)*d;
x = inv(L')*y;