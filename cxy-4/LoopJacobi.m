function [cv] = LoopJacobi(n) %循环Jacobi方法
    A = generate(n);
    real = eig(A);
    TOL = 10^(-6);
    for k = 1:10000000       
        for p = 1:n-1
            for q = p+1:n
                C = A;
                theta = acot((A(p,p)-A(q,q))/(2*A(p,q)))/2;
                b = cot(2*theta);
                if b >= 0
                    t = -b+sqrt(1+power(b,2));
                else
                    t = -b-sqrt(1+power(b,2));
                end
                c = cos(theta);
                s = sin(theta);
                temp1 = C(p,p) + t*C(p,q);  %临时变量，用来存储A(p,p)处的值
                temp2 = C(q,q) - t*C(p,q);  %临时变量，用来存储A(q,q)处的值
                for j = 1:n
                    A(p,j) = c*C(p,j) + s*C(q,j);
                    A(q,j) = -s*C(p,j) + c*C(q,j);
                end
                for i = 1:n
                    A(i,p) = c*C(i,p) + s*C(i,q);
                    A(i,q) = -s*C(i,p) + c*C(i,q);
                end
                A(p,p) = temp1;
                A(q,q) = temp2;
                A(p,q) = 0;
                A(q,p) = 0;
                cv(k) = norm(sort(diag(A),'descend')-sort(real,'descend'));
                if norm(A - diag(diag(A)),'fro') < TOL
                   LJ  = diag(A);
                    k  
                    return ;
                end
            end
        end
    end
end
