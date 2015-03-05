%以下是变系数Richardson迭代法的实现
foot = zeros(1,29);
wuchac = zeros(1,29);
wuchaz = zeros(1,29);
for n1 = 2:30
A = generate(n1); % A为系数矩阵
n = n1*n1; %为方程的阶数
bresult = A*ones(n,1);
TOL = power(10,-6); %误差指标
b = max(abs(eig(A)));
a = min(abs(eig(A)));
b1 = (b-a)/2;
b2 = (b+a)/2;
x0 = zeros(n,1); % 初始向量
x = zeros(n , 1); % x为近似解
m = 10000;
theta = ones(n,1);
tol = ones(n,1);
%下面计算参数组的值
for  k = 1:m
    theta(k) = (2*k-1)*pi/(2*n);
    tol(k) = 1/(b1*theta(k)+b2);
end
for k = 1:m
      x = x0 + tol(k)*(bresult-A*x0);
      if max(abs(x-x0)) < TOL
          x;
          break;    
      end
      wuchaz(n1-1) =log(norm(x-1));
      wuchac(n1-1) = log(norm(A*x-bresult));
      x0 = x;
end
end
wuchac
wuchaz