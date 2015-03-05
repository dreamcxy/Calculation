function [] = QR( m,n )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
A = generate(m,n);
n = rank(A);    
r = zeros(m,n);
%   Gram-Schmidt 分解法
% for k = 1:n-1
%     r(k,k) = norm(A(:,k));
%     A(:,k) = A(:,k)/r(k,k);
%     for j = k+1:n
%         r(k,j) = A(:,k)'*A(:,j);
%         A(:,j) = A(:,j) - r(k,j)*A(:,k);
%     end
%     r(n,n) = norm(A(:,n));
%     A(:,n) = A(:,n)/r(n,n);
% end
% A
% r

%   Householder 分解法
    function [] = HouseHolder(A)
for k = 1:n-1
    delta = 0;
    for i = k :m
        delta = (delta + A(i,k)^2)^(1/2);
    end
    if A(k,k) >= 0
        delta = (-1)*delta;
    end
    h = delta - A(k,k);
    A(k,k) = (-1)*h;
    d(k) = delta;
    b = d(k)*h;
    for j = k+1:n
        sum1 = 0;
        for i = k+1:m
            sum1 = sum1 + A(i,k)*A(i,j);
        end
        delta = (A(k,j)*h-sum1)/b;
        A(k,j) = A(k,j) - delta*h;
    end
    for i = k+1:m
        A(i,j) = A(i,j) + delta*A(i,k);
    end
    if m == n
        A
        break;
    else
        sum2 = 0;
        for i = n:m
            sum2 = sum2 + A(i:n)^2;
        end
        delta = sum2^(1/2);
        if A(n,n) >=0
            d(n) = -delta;
        else
            d(n) = delta;
        end
        A(n,n) = A(n,n)-d(n);
    end
    A
end
    end

end

    


