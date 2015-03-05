n = 10;
a = 4;
B1 = eye(n-1);
b = a*ones(n-1,1);
B1 = [B1,b];
b = [b;1];
c = b';
B1 = [B1;c];
spy(B1);
% tic
% [L,U,P] = lu(B1)
% toc
% spy(B1)
l = zeros(n);
u = eye(n);
y = zeros(n,1);
x = zeros(n,1);
%下面是未修改的Crout算法
tic
for i = 1:n
    l(i,1) = B1(i,1);
end
for j = 1:n
    u(1,j) = B1(1,j)/l(1,1);
end
for k = 2:n
    for i = k:n
        sum = 0;
%         syms r;
%         l(i,k) = B1(i,k) -  symsum(l(i,r)*u(r,k),[1,k-1]);
%   比较莫名其妙，不知道错在哪儿，报错也十分奇特
        for r = 1:k-1
            sum = sum + l(i,r)*u(r,k);
        end
        l(i,k) = B1(i,k)-sum;
    end
    for j = k+1:n
        sum = 0;
        %u(k,j) = (B1(k,j) - symsum(l(k,r)*u(r,j),[1,k-1]))/l(k,k);
        for r = 1:k-1
            sum = sum+l(k,r)*u(r,j);
        end
        u(k,j) = (B1(k,j)-sum)/l(k,k);
    end
end
toc
%下面使用改进后的Crout算法
figure(1);
spy(l);
figure(2);
spy(u);
B1;
tic
l(1,1) = B1(1,1);
u(1,4) = B1(1,4)/l(1,1);
for k = 2:n-1
    for i = k:n
        l(i,k) = B1(i,k);
    end
    for j = k+1:n
        u(k,j) = B1(k,j)/l(k,k);
    end
end
toc
    