function [x] = A(n)
        %B = zeros(n,n);
        E=eye(n,n);
        T=4*E;
        for i=1:n-1
            T(i,i+1)=-1;
            T(i+1,i)=-1;
        end
        for i=1:n
            B((i-1)*n+1:i*n,(i-1)*n+1:i*n)=T;
        end
        for i=1:n-1
            B((i-1)*n+1:i*n,i*n+1:(i+1)*n)=-1*E;
            B(i*n+1:(i+1)*n,(i-1)*n+1:i*n)=-1*E;
        end
        x = cond(B);
end

