%foot = zeros(49,1);
n1 = 101;
wuchac = zeros(n1,1);
wuchaz = zeros(n1,1);
A = generate(n1); % AΪϵ������
n = n1*n1; %Ϊ���̵Ľ���
bresult = A*ones(n,1);
TOL = power(10,-6); %���ָ��
x0 = zeros(n,1); % ��ʼ����
x = zeros(n , 1); % xΪ���ƽ�
k = 1;
r = A*x - bresult;
p = -1*r;
del0 = r'*r;
while(1)
    if k == n+1
    disp('Exceed');
    break;
    end
    k = k+1;
    arfa = del0/(p'*A*p);
    x = x + arfa*p;
    r = A*x -bresult;
    del1 = r'*r;
    beta = del1/del0;
    del0 = del1;
    p = -r + beta*p;
    if del1 <= TOL
        break;
    end
    wuchac(k) = log(norm(A*x-bresult));
    wuchaz(k) = log(norm(x-1));
end
% foot(n1- 1) = k;
% end
% foot
wuchac
wuchaz