%�������ƫ΢�ַ�����ʵ������
function[] = cnrel(x,t)
syms the
%fun = inline('exp(-power((x-the),2)/(4*t))*f1(x)/(2*sqrt(pi*t))','the');
fun = exp(-power((x-the),2)/(4*t))*f1(x)/(2*sqrt(pi*t));
u =  INTEGRAL('fun',-pi,pi)