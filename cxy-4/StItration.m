function[] =StItration(n)   %ͬʱ������
A = generate(n);
wucha1 = zeros(n,1);    %������ֵ������½� 
wucha2 = zeros(n,1);    %�ڶ�������ֵ������½�
real = sort(eig(A),'descend');  %��������ֵ��������
real1 = real(n,1); %�����������ֵ
real2 = real(n-1,1);    %����ĵڶ�������ֵ
m = 2;
V = zeros(n,m);
u =10*rand(m,1);  
b = max1(u);
u = u/b;
TOL = 10^(-6);
for k = 1:m
    V(:,k) = 10*rand(n,1);
end
V = orth(V);
Max_value = 100000;
lembda = zeros(1,n);
for j  = 1:Max_value
    U = A*V;
    [V,R] = qr(U);
    for k = 1:n
        lembda(1,k) = A*V(:,k)\V(:,k);
    end
    lembda = sort(lembda,'descend');
    wucha1(j,1) = norm(lembda(1,n)-real1);
    wucha2(j,1) = norm(lembda(1,n-1)-real2);
end
V ; %V��ֵ��������������ֵ
% lembda = zeros(1,n);
% for k  = 1:n
%     lembda(1,k) = A*V(:,k)\V(:,k);
% end
plot(wucha1,'or');
hold on;
plot(wucha2,'-b')