function [gouzao] = gouzao(m)
%n = m*m;
A = 4*ones(1,m);
B = (-1)*ones(1,m-1);
T = diag(A)+diag(B,1)+diag(B,-1);
I = (-1)*eye(m);
a = blkdiag(kron(eye(m),T))+kron(diag(ones(1,m-1),1),I)+kron(diag(ones(1,m-1),-1),I);
gouzao = a;
end
