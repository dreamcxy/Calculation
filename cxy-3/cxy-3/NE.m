%�����Ƿ������鷨����С���˽�
function [x] = NE(A,b)
%AΪϵ������bΪ��
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
L = chol(c,'lower');%����c��cholesky�ֽ�
y = inv(L)*d;
x = inv(L')*y;