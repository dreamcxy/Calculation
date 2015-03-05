function [zhuyuan] = zhuyuan(m)
n = m*m;
A = 4*ones(1,m);
B = (-1)*ones(1,m-1);
T = diag(A)+diag(B,1)+diag(B,-1);
I = (-1)*eye(m);
A = blkdiag(kron(eye(m),T))+kron(diag(ones(1,m-1),1),I)+kron(diag(ones(1,m-1),-1),I);
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
zhuyuan = max(a);
zhuyuan = zhuyuan/a0;
end
