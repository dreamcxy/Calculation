   function [] = HouseHolder(A)
   [m1,n1] = size(A);
m = max(m1,n1);
n = rank(A);
d = zeros(n,1);
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
            sum2 = sum2 + power(A(i:n),2);
        end
        delta = power(sum2,1/2);
        if A(n,n) >=0
            d(n,n) = -delta;
        else
            d(n,n) = delta;
        end
        A(n,n) = A(n,n)-d(n,n);
    end
    A
end
    end