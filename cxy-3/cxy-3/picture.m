X = load('matlab.mat');
k = 5;
[U,S,V] = svd(X);
colormap('gray');
image(U(:,1:k)*S(1:k,1:k)*V(:,1:k)');