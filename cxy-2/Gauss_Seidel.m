function [] = Gauss_Seidel(n)
A = generate(n);
n = n*n;    %AÉú³ÉÁËn*n½×¾ØÕó
x = ones(n,1);
x0 = zeros(n,1);
b = A*x;
m = 1000;
TOL = 0;
summ = 0;
summ1 = 0;
for k = 1 : m 
    for i =1 : n
        for j = i+1 : n 
            summ = summ + a(i,j)*x0(j);
        end
        for j = 1:i-1
            summ1 = summ1 + a(i,j)*x(j);
        end
        x(i) = (b(i)-summ1-summ)/a(i,i);
    end
    if (max(abs(x - x0)))<TOL
        break;
    end
    for i = 1:n
        x0(i) = x(i);
    end
end



        