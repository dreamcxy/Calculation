function [] = SOR(n)
A = generate(n);
n = n*n;    %A生成了n*n阶矩阵
x = ones(n,1);
x0 = zeros(n,1);
b = A*x;
m = 1000;
TOL = 0;
summ = 0;
summ1 = 0;
w = 0 %迭代因子
for k = 1 : m 
    for i =1 : n
        for j = i+1 : n 
            summ = summ + a(i,j)*x0(j);
        end
        for j = 1:i-1
            summ1 = summ1 + a(i,j)*x(j);
        end
        x(i) = (1-w)*x0(j) +  w*(b(i)-summ-summ1)/a(i,i);
    end
    if (max(abs(x - x0)))<TOL
        break;
    end
    for i = 1:n
        x0(i) = x(i);
    end
end



        