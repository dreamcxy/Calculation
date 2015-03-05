n = 10;
a = 4;
%下面B2的构造方法后者直接用rot函数，将B1选装90°即可
B2 = diag(ones(1,n));
b = a*ones(n-1,1);
B2(2:n,1) = a;
B2(1,2:n) = a;
B2
spy(B2);
%[L,U,P] = lu(B2)
% spy(B2);
l = zeros(n);
u = eye(n);
%下面实现crout算法的解法
for i = 1:n
    l(i,1) = B2(i,1);
end
for j = 1:n
    u(1,j) = B2(1,j)/l(1,1);
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
        l(i,k) = B2(i,k)-sum;
    end
    for j = k+1:n
        sum = 0;
        %u(k,j) = (B1(k,j) - symsum(l(k,r)*u(r,j),[1,k-1]))/l(k,k);
        for r = 1:k-1
            sum = sum+l(k,r)*u(r,j);
        end
        u(k,j) = (B2(k,j)-sum)/l(k,k);
    end
end
% figure(1);
% spy(l);
% figure(2);
% spy(u);

%下面是改进后的Crout算法
%因为非零元素的分布，没必要进行修改