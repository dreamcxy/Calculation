function [] = cn(J)
% J means the number of grid points
miu = 0.4 
T = 1; % System size
deltax = (2*pi)/J; % Space step
deltat = miu*(deltax^2); % Time step
tstep = ceil(T/deltat); % Number of steps
%Set initial and boundary conditions
%下面生成对应的两个J阶循环型三对角阵
%先生成B1
for j = 1:J
    A1(1,j)=2+2*miu;
end
for j = 1:J-1
    A2(1,j)=-miu;
end
B1 = diag(A1)+diag(A2,-1)+diag(A2,1);
w1 = zeros(J,1);
w1(1,1) = 1;
w1(J,1) = -1;
z1 = zeros(J,1);
z1(1,1) = -miu;
z1(J,1) = miu;
%下面生成B0
for j = 1:J
    C1(1,j) = 2-2*miu;
end
for j =1:J-1
    C2(1,j) = miu;
end
B0 = diag(C1)+diag(C2,-1)+diag(C2,1);
B0(1,J) = miu;
BO(J,1) = miu;
%下面输入初值解
u = zeros(J,1);
for j = 1:J
    u(j) = f1(-pi+j*deltax);
end
u
% for i = 1:J
%     u(j) = f2(-pi+j*deltax);
% end
%下面进行等式右边的处理
u = B0*u;
%下面进行方程的求解 
% a1 = inv(B1)*u;
% a2 = inv(1-z1'*inv(B1)*w1)*inv(B1)*w1*z1'*inv(B1)*u;
% u = a1+a2
%下面进行逐层往上推进u的计算
%利用二阶数组进行存储，利用行向量表示时间层的推进，利用列向量表示空间层的推进
u = zeros(tstep,J)
for t = 0:tsteps
    a1 = inv(B1)*u;
    a2 = inv(1-z1'*inv(B1)*w1)*inv(B1)*w1*z1'*inv(B1)*u;
end

    