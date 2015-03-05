function [H,rho]=Householder(x,y)
% ��������ԳƵ�Householder����H��ʹHx=rho*y������rho=||x||/||y||
%
% ����˵��
% x��������
% y����������x��y���������ͬ��ά��
%
% ʵ��˵��
% x=[3 5 6 8]';
% y=[1 0 0 0]';
% H=householder(x,y);
% H*x-rho*y % ��֤Hx=rho*y
% H'*H % ��֤����
%
% ����HouseHolder�任
% 1.H=I-2vv'������||v||=1�����ǳ�HΪ����(HouseHolder)������֤H�Գ�������
% 2.���||x||=||y||����ô����HouseHolder����H=I-2vv������v=��(x-y)/||x-y||��ʹHx=y
% 3.���||x||��||y||����ô����HouseHolder����H��ʹHx=rho*y������rho=||x||/||y||
% 4.Householder���󣬳����ڽ�һ������Aͨ�������任�Խ���
%
% by dynamic of Matlab������̳
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