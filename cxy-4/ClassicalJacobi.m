function[cv] = ClassicalJacobi(n)
    format long;
    %古典Jacobi的方法实现
    A = generate(n);
    real = eig(A);
    TOL = 10^(-6);
    %下面求取A对角线上方的按绝对值最大值
    for k = 1:2000000
    B = triu(A,1); 
    [mx,q] = max(max(abs(B)));
    p = 1;
    while(abs(B(p,q))~=mx )
    p = p+1;
    end
    mx = A(p,q);
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %下面生成R
    C = A;
    if C(p,p) ~= C(q,q)
        theta = atan(2*C(p,q)/(C(p,p)-C(q,q)))/2;
    else
        theta = sign(C(p,q))*pi/4;
    end
    R = eye(n);
    R(p,p) = cos(theta);    
    R(p,q) = sin(theta);
    R(q,p) = -sin(theta);
    R(q,q) = cos(theta);
    A = R*C*R';
    cv(k) = norm(sort(diag(A),'descend')-sort(real,'descend'));
    if norm(A - diag(diag(A)),'fro') < TOL
        CJ = diag(A);
        k;
        break;
    end
    end
end