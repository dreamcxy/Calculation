wucha = zeros(1,95);
foot = zeros(1,29);
for n = 2:30
A= 4*ones(1,n);
B=(-1)*ones(1,n-1);
T=diag(A)+diag(B,1)+diag(B,-1);
I=(-1)*eye(n);
D=blkdiag(kron(eye(n),T))+kron(diag(ones(1,n-1),1),I)+kron(diag(ones(1,n-1),-1),I);
D;
nn = n*n;
xx = zeros(nn,1);
x = zeros(nn,1);
b = D*ones(nn,1);
TOL=power(10,-6);
m=10000;%预设迭代次数
max2=100;
r = 1;
for k = 1:m
    for i = 1:nn
        t=0;
        for j = 1:nn
            if (j ~= i)
                t=t+D(i,j)*xx(j);
            end
        end
        x(i)=(b(i)-t)/D(i,i);
    end
%     k
%     wucha(k) = log(abs(max(x-xx)))%考虑的是相邻误差
%   k
%     wucha(k) = log(abs(max(D*x-b)))%考虑的是残量
   %相邻误差
%     tt=abs(x-xx);
%     max1=0;
%     for i=1:nn
%         if (max1<tt(i))
%         max1=tt(i);
%         end
%     end
%     if (max1<TOL)     
%      %   k
%        wucha(n-1) = log(max1);
%         break;                                                                                                                                                                                                                                                                        
%     end

%   残量
%    tt=abs(D*x-b);
%    max1=0;
%     for i=1:nn
%         if (max1<tt(i))
%         max1=tt(i);
%         end
%     end
%     if (max1<TOL)     
%         k
%       %  wucha(n-1) = log(max(abs(x-1)));
%         break;                                                                                                                                                                                                                                                                        
%     end    
%     norm(x-1)
%      wucha(k)= norm(max1);
% %   后验误差
%     tt=abs(x-xx);
%     max1=0;
%     for i=1:nn
%         if (max1<tt(i))
%         max1=tt(i);
%         end
%     end
%     if (max1*max1/(max2-max1)<TOL)     
%         wucha(n-1) = log(max(abs(x-1)));
%         break;                                                                                                                                                                                                                                                                        
%     end
%    max2=max1;
%   真实误差
    if abs(max(x-1))<TOL
       k
        break;
    end
    for i = 1:nn
    xx(i)=x(i);
    end
   
end
 foot(n-1) = k;
end
% foot(n-1) = k;
% foot
%foot(n-1) = k;
foot
