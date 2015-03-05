%���÷��ݷ�������2������ֵ�������Ӧ�������������۲��Ƿ�����ν�ġ�һ�ε���������

function [wucha] = EX617(n)
wucha = zeros(n,1);
A = generate(n);
v0 = ones(n,1);
real = eig(A)
TOL = 10^(-6);
m = 10^(6);
q = 2;
k = 1;
b = max1(v0);
v = v0/b;
I = eye(n);
while k <= m
    if det(A - q*I) == 0
        disp('q is an eigenvalue ')
        break;
    else
        u = (A-q*I)\v;
        b = max1(u);
        ERR = norm((v - u/b),Inf);
        v = u/b;
%         log10(abs(b - (min(real-2)+2)))
%         b - (min(real-2)+2)
        if ERR < TOL
            b = (1/b)+q;
            b
            v
            k
            break
        end
    end
    wucha(k,1) = log(norm(b - 2));
    k = k+1;
end
%test ����
% wucha = EX617(100)
% size(wucha)
% k = 1:size(wucha);
 plot(wucha)