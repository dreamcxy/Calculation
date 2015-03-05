function[] = EX616(n)
wucha1 = zeros(n,1);    %代表的是主特征值误差
dist = zeros(n,1);    %代表的是特征子空间之间的距离
A = generate(n);
real = max(eig(A));%系统自带的最大特征值
%下面利用系统eig找出A的主特征向量
[fv,cv] = eig(A);   %cv是特征值（n*n），fv是特征向量
%下面程序是执行查找最大特征值对应的特征向量
D = diag(cv);  %特征值的矩阵表示形式
[MaxValue,index] = max(D);
Maxfv = fv(:,index);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
TOL = 10^(-6);  %迭代容限
m = 200000; %最大迭代次数
u0 = ones(n,1);
u = ones(n,1);  %初始向量
b = max1(u);    %重写max方法，按模取最大值
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
    theta = subspace(Maxfv',u');  %返回两个向量之间的夹角
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
