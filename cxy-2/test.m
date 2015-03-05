A = generate(3);
D = diag(diag(A));
I  = eye(9) - inv(D)*A
w =1-power( vrho(I),2);
w = 2/(1+power(w,1/2))