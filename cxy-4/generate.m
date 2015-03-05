function [T] = generate(n)
A = 2*ones(1,n);
B = (-1)*ones(1,n-1);
T = diag(A)+diag(B,1)+ diag(B,-1);
end 