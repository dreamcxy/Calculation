n=100;
foot = zeros(1,20);
A= 4*ones(1,n);
B=(-1)*ones(1,n-1);
T=diag(A)+diag(B,1)+diag(B,-1);
I=(-1)*eye(n);
D=blkdiag(kron(eye(n),T))+kron(diag(ones(1,n-1),1),I)+kron(diag(ones(1,n-1),-1),I);
E = diag(diag(D));
nn = n*n;
E = eye(nn)-inv(D)*D;
x = zeros(nn,1);
b = D*ones(nn,1);
TOL=power(10,-6);
m=10000;
max2=100;
r = 3;
    w = 2/(1+power(1-power(vrho(E),2),1/2));
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
%   ��ʵ���
    if max(abs(x-1)) < TOL
            k
%         foot(r-2) = k;
        break
    end

%    �������
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

%   ����
%    tt=abs(D*x-b);
%    max1=0;
%     for i=1:nn
%         if (max1<tt(i))
%         max1=tt(i);
%         end
%     end
%     if (max1<TOL)     
%         k
%         x-1
%         break;                                                                                                                                                                                                                                                                        
%     end    

%   �������
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
%     r = r+1;

% foot