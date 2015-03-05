foot = zeros(1,29);
for n = 2:30

A= 4*ones(1,n);
B=(-1)*ones(1,n-1);
T=diag(A)+diag(B,1)+diag(B,-1);
I=(-1)*eye(n);
D=blkdiag(kron(eye(n),T))+kron(diag(ones(1,n-1),1),I)+kron(diag(ones(1,n-1),-1),I);
D;
nn = n*n;
x = zeros(nn,1);
b = D*ones(nn,1);
TOL=power(10,-6);
m=10000;
max2=100;
E = diag(diag(D));
F  = eye(nn) - inv(E)*D;
w =1-power( vrho(F),2);
w = 2/(1+power(w,1/2))
xx = zeros(nn,1);
    for k = 1:m
    for i = 1:nn
        t=0;
        s=0;
        for j = 1:i-1
            t=t+D(i,j)*x(j);
        end
        for j = i+1:nn
            s=s+D(i,j)*xx(j);
        end
        x(i)=(1-w)*xx(i)+w*(b(i)-t-s)/D(i,i);
    end
%   真实误差
    if max(abs(x-1)) < TOL
        k;
        break
    end

%    相邻误差
%     tt=abs(x-xx);
%     max1=0;
%     for i=1:nn
%         if (max1<tt(i))
%         max1=tt(i);
%         end
%     end
%     if (max1<TOL)     
%        % k
%         x-1
%         break;                                                                                                                                                                                                                                                                        
%     end

%   残量
%   tt=abs(D*x-b);
%    max1=0;
%     for i=1:nn
%         if (max1<tt(i))
%         max1=tt(i);
%         end
%     end
%     if (max1<TOL)     
% %         k
% %         x-1
%         break;                                                                                                                                                                                                                                                                        
%     end    
%     wucha(k) = norm(max1);
%   后验误差
%     tt=abs(x-xx);
%     max1=0;
%     for i=1:nn
%         if (max1<tt(i))
%         max1=tt(i);
%         end
%     end
%     if (max1*max1/(max2-max1)<TOL)     
%         k
%         x-1
%         break;                                                                                                                                                                                                                                                                        
%     end
%    max2=max1;
    for i = 1:nn
    xx(i)=x(i);
    end
   
    end
     foot(n-1) = k;
end
foot
