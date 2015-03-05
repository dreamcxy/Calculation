% function [wucha1,wucha2,wucha3,wucha4] = Ex615(n)
function [time1,time2,time3,time4] = Ex615(n)
A1 = 2*ones(1,n);
B1 = (-1)*ones(1,n-1);
T1 = diag(A1)+diag(B1,-1)+diag(B1,1);
A = T1(1:n,1:n-1)%����A
%��������B
b = zeros(n,1);
b(1,1) = 1; 
b(n-1,1) = 1;
c = zeros(n,1);
for i = 1:n-1
    c(i,1) = i/n;
end
b = b + c;
b;
xls = ones(n,1);
%����ִ����Ҫ����

%��ΪMGS����������Ľ�
tic;
[Q,R] = QR_GS(A);
x = inv(R)*Q'*b;
wucha1 = log(norm(x-1));
time1 = toc;
%��Ϊ��������Ľ�
tic;
x = NE(A,b);
wucha2 = log(norm(x-1));
time2 = toc;

%��ΪHouseHolder����
tic;
x = QR_Housholder(A,b);
wucha3 = log(norm(x-1));
time3 = toc;

%��ΪGivens����
tic;
x = QR_Givens(A,b);
wucha4 = log(norm(x-1));
time4 = toc;