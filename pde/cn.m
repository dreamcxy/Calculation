function [] = cn(J)
% J means the number of grid points
miu = 0.4 
T = 1; % System size
deltax = (2*pi)/J; % Space step
deltat = miu*(deltax^2); % Time step
tstep = ceil(T/deltat); % Number of steps
%Set initial and boundary conditions
%�������ɶ�Ӧ������J��ѭ�������Խ���
%������B1
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
%��������B0
for j = 1:J
    C1(1,j) = 2-2*miu;
end
for j =1:J-1
    C2(1,j) = miu;
end
B0 = diag(C1)+diag(C2,-1)+diag(C2,1);
B0(1,J) = miu;
BO(J,1) = miu;
%���������ֵ��
u = zeros(J,1);
for j = 1:J
    u(j) = f1(-pi+j*deltax);
end
u
% for i = 1:J
%     u(j) = f2(-pi+j*deltax);
% end
%������е�ʽ�ұߵĴ���
u = B0*u;
%������з��̵���� 
% a1 = inv(B1)*u;
% a2 = inv(1-z1'*inv(B1)*w1)*inv(B1)*w1*z1'*inv(B1)*u;
% u = a1+a2
%���������������ƽ�u�ļ���
%���ö���������д洢��������������ʾʱ�����ƽ���������������ʾ�ռ����ƽ�
u = zeros(tstep,J)
for t = 0:tsteps
    a1 = inv(B1)*u;
    a2 = inv(1-z1'*inv(B1)*w1)*inv(B1)*w1*z1'*inv(B1)*u;
end

    