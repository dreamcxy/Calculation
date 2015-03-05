%���ݷ�
function [cv,fv,wucha] = PW(n) %cv��characteristic value ��fv��feature vector
%n = size(A,1);
A = generate(n);
TOL = 10^(-6);%��������
m = 200000;%����������
u =10*rand(n,1);    %��ʼ������ʹ���������ӿռ��ϵ�ͶӰ��Ϊ0
b = max1(u);
u = u/b;
real = max(eig(A));
for k = 1:m
    v = A*u;
    b = max1(v);
%     if b == 0
%         disp('eigenvector',u);
%         disp('A has eigenvalue 0,seclect new vector u0 and restart');
%         break;
%     end
    w = v/b;
    ERR = norm(u-w,Inf);
    u = w; 
    wucha(k) = b;
    if ERR < TOL
        cv = b;
        fv = u;
        break;
    end
    k = k+1;
end
plot(wucha)
cv = b;
fv = u;
% disp('Maximum number of iterations exceed');
end
