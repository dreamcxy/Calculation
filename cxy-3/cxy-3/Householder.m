function [H,rho]=Householder(x,y)
% 求解正交对称的Householder矩阵H，使Hx=rho*y，其中rho=||x||/||y||
%
% 参数说明
% x：列向量
% y：列向量，x和y必须具有相同的维数
%
% 实例说明
% x=[3 5 6 8]';
% y=[1 0 0 0]';
% H=householder(x,y);
% H*x-rho*y % 验证Hx=rho*y
% H'*H % 验证正交
%
% 关于HouseHolder变换
% 1.H=I-2vv'，其中||v||=1，我们称H为反射(HouseHolder)矩阵，易证H对称且正交
% 2.如果||x||=||y||，那么存在HouseHolder矩阵H=I-2vv，其中v=±(x-y)/||x-y||，使Hx=y
% 3.如果||x||≠||y||，那么存在HouseHolder矩阵H，使Hx=rho*y，其中rho=||x||/||y||
% 4.Householder矩阵，常用于将一个矩阵A通过正交变换对角阵
%
% by dynamic of Matlab技术论坛
% see also http://www.matlabsky.com
% contact me matlabsky@gmail.com
% 2010-01-16 23:31:29
%
x=x(:);
y=y(:);
if length(x)~=length(y)
    error('The Column Vectors X and Y Must Have The Same Length!');
end
rho=norm(x)/norm(y);
y=rho*y;
v=(x-y)/norm(x-y);
I=eye(length(x));
H=I-2*v*v';