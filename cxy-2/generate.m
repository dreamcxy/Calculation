function [T] = generate(n)
A = 4*ones(1,n);
B = (-1)*ones(1,n-1);
T1 = diag(A)+diag(B,-1)+diag(B,1);
I = (-1)*eye(n);
D = blkdiag(kron(eye(n),T1))+kron(diag(ones(1,n-1),1),I)+kron(diag(ones(1,n-1),-1),I);
T = D;