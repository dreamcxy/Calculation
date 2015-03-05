function [RA,RB,n,X]=gaus(A,b) 
B=[A b]; 
n=length(b);
RA=rank(A); 
RB=rank(B);
zhica=RB-RA; 
if zhica>0, 
disp('请注意：因为RA~=RB，所以此方程组无解.') 
return
end 
if RA==RB 
    if RA==n 
        disp('请注意：因为RA=RB=n，所以此方程组有唯一解') 
        X=zeros(n,1); 
        for p= 1:n-1 
            for k=p+1:n 
                m= B(k,p)/ B(p,p);
                B(k,p:n+1)= B(k,p:n+1)-m*B(p,p:n+1);
            end
        end
        b=B(1:n,n+1);
        A=B(1:n,1:n); 
        X(n)=b(n)/A(n,n);
        for q=n-1:-1:1
            X(q)=(b(q)-sum(A(q,q+1:n)*X(q+1:n)))/A(q,q); 
        end
    else disp('RA=RB<n')
    end
end
end
% n = 4;
% A = 4*ones(1,n);
% B = (-1)*ones(1,n-1);
% T = diag(A)+diag(B,1)+diag(B,-1);
% I = eye(n)*(-1);
% D = blkdiag(kron(eye(n),T))+kron(diag(ones(1,n-1),1),I)+kron(diag(ones(1,n-1),-1),I);
% [RA,RB,n,X] = (A,b);

 