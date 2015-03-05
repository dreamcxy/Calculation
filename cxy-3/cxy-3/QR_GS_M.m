%输入A的各列元素
%输出Q的各列元素,以及U/R的元素
function [Q,R] = QR_GS_M(A)
    format short e
    [m1,n1] = size(A);
    m = max(m1,n1);
    n = min(m1,n1);
    u = zeros(n,n); %A=qu
    %q = zeros(m,n);利用数据储存技术
    u(1,1) = norm(A(:,1));
    A(:,1) = A(:,1)/u(1,1);
    for j = 2:n
        for i = 1:j-1
            u(i,j) = A(:,i)'*A(:,j);
        end
        sum1 = 0;
        for i = 1:j-1
            sum1 = sum1 + u(i,j)*A(:,i);
        end
        u(j,j) = norm(A(:,j)-sum1);
        A(:,j) = (A(:,j)-sum1)/u(j,j);
    end
    Q = A;
    R = u;
        