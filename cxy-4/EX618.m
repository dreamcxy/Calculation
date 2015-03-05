function [cv,fv] = EX618(n)
A = generate(n);
eig(A);
n = size(A,1);
[b,x1,wucha1] = PW(A);
 plot(wucha1,'ob');
hold on;
t = norm(x1);
Te = diag(1,n-1);  %利用Te生成e1
e1 = Te(1:n,n);
u = x1 - t*e1;
b = t*(t - e1'*x1);
p = (A*u)/b;
beta = (u'*p)/b;
v = p - beta*u/2;
A = A - (u*v'+v*u');
eig(A(2:n,2:n));
[cv,fv,wucha2] = PW(A(2:n,2:n))
plot(wucha2,'og')

