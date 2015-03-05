DIM = 80;    %定义对角阵的阶数 DIM
for i = 1:DIM
    C(1,i) = 1/(2^(i));
end
C;
A = diag(C);

d = diag(A); 
i = 1:size(d);
plot(i,log(diag(d)));
hold on;
B = orth(rand(DIM));%选取直交阵 
size(A)
size(B)
A = B*A*B';
tic
[QMGS,RMGS] = QR_GS(A);
toc
dMGS = log(diag(RMGS));
norm(QMGS*QMGS'-eye(DIM))
norm(A-QMGS*RMGS)
plot(i,dMGS,'.');
hold on 
tic
[QCGS,RCGS] = QR_GS_M(A);
toc
norm(QCGS*QCGS'-eye(DIM))
norm(A-QCGS*RCGS)
dCGS = log(diag(RCGS));
plot(i,dCGS,'o');
