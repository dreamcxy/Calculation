% A = [1,2,3,1;
%      2,3,-4,3;
%      3,4,5,3;
%      2,4,4,3];
%  tril(A,-1)
% n = size(A,1); 
% B = triu(A,1);
% [mx,id] = max(max(abs(B)));
% j = 1;
% while(abs(B(j,id))~=mx )
%     j = j+1;
% end
% j
% mx = A(j,id)
% id

A = [10^40,10^29,10^19;
     10^29,10^20,10^9;
     10^19,10^9,1]
 ThresholdJacobi(A)
 eig(A)