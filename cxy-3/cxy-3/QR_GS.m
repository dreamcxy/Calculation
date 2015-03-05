%输出MGS方法得到的QR分解矩阵
function [Q,R] = QR_GS( A )
format short e
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
[m1,n1] = size(A);
m = max(m1,n1);
n = min(m1,n1);
r = zeros(n,n);
%   Gram-Schmidt 分解法
for k = 1:n-1
    r(k,k) = norm(A(:,k),2);
    A(:,k) = A(:,k)/r(k,k);
    for j = k+1:n
        r(k,j) = A(:,k)'*A(:,j);
        A(:,j) = A(:,j) - r(k,j)*A(:,k);
    end
end
    r(n,n) = norm(A(:,n),2);
    A(:,n) = A(:,n)/r(n,n);
% A
r;
Q = A;
R = r;
end