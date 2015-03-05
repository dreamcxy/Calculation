% n = 4;
% a = 2*ones(1,n);
% b = (-1)*ones(1,n-1);
% c = (-1)*ones(1,n-1);
% A = diag(a)+diag(b,1)+diag(c,-1);
%inv(T)�������к�������õ������
function [F] = Gauss_Jorden(A)
n = rank(A);
[x,y] = size(A);
if x ~= y
    disp('�����������');
else
    d = det(A);
    if d == 0
        disp('�������');
    else
        B=eye(x);
        A = [A,B];
        y = 2*y;
        for k = 1:x  %�����ѭ����������Ԫ
            max = abs(A(k,k));
            r = k;
            for L = k+1:x;
                if max < abs(A(L,k))
                    max = abs(A(L,k));
                    r = L;
                end
            end
            t = A(k,:);
            A(k,:) = A(r,:);
            A(r,:) = t;
            s = A(k,k);
            for j = 1:y
                A(k,j) = A(k,j)/s;%���г���
            end
            for i = 1:x
                if i ~= k
                    for j = k+1:y
                        A(i,j) = A(i,j)-A(i,k)*A(k,j); %�б任
                    end
                end
            end
        end
        F = A(:,x+1:y);
        disp('�þ������ F =')
    end
end



    
