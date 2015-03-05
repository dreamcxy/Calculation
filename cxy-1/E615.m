function [ha] = E615(n)
A = 100*rand(n);
a0 = max(max(A));
if a0 == 0
    disp('Method Failed');
    return;
end
a = zeros(1,n-1);
%对A进行列主元分解
for k = 1:n-1
    r = k;
    for i = k+1:n
        if abs(A(i,k))>abs(A(r,k))
            r = i;
        end
    end
    if A(r,k) == 0
        disp('A is singular');
        return 
    end
    if r ~= k
        t = A(k,k:n);A(k,k:n) = A(r,k:n);A(r,k:n) = t;
    end
    A(k+1:n,k) = A(k+1:n,k)/A(k,k);
    A(k+1:n,k+1:n) = A(k+1:n,k+1:n)-A(k+1:n,k)*A(k,k+1:n);
    A(k+1:n,k) = 0;
    a(k) = max(max(A));
end
ha = max(a);
ha = ha/a0;
end

    
    