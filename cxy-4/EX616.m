function[] = EX616(n)
wucha1 = zeros(n,1);    %�������������ֵ���
dist = zeros(n,1);    %������������ӿռ�֮��ľ���
A = generate(n);
real = max(eig(A));%ϵͳ�Դ����������ֵ
%��������ϵͳeig�ҳ�A������������
[fv,cv] = eig(A);   %cv������ֵ��n*n����fv����������
%���������ִ�в����������ֵ��Ӧ����������
D = diag(cv);  %����ֵ�ľ����ʾ��ʽ
[MaxValue,index] = max(D);
Maxfv = fv(:,index);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
TOL = 10^(-6);  %��������
m = 200000; %����������
u0 = ones(n,1);
u = ones(n,1);  %��ʼ����
b = max1(u);    %��дmax��������ģȡ���ֵ
u = u/b;
cv1 = zeros(n,1);
for k = 1:m
    v = A*u;
    b = max1(v);
    if b == 0
        disp('eigenvector',u);
        disp('A has eigenvalue 0,seclect new vector u0 and restart');
        break;
    end
    w = v/b;
    ERR = norm(u-w,Inf);
    u = w;
    cv1(k) = b;
    wucha1(k) = log(norm(b-real));
    theta = subspace(Maxfv',u');  %������������֮��ļн�
    dist(k) = sin(theta)*(10^3);
    if ERR < TOL
        b
        u;
        k
        break;
    end
    k = k+1;
end
plot(cv1)
 %plot(wucha1)
% hold on ;
%plot(dist);
end
