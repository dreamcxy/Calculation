dim = 101;
format long;
% cv1 = ThresholdJacobi(dim) %·§Öµ
% plot(cv1,'-ob');
% hold on;
% cv2 = LoopJacobi(dim)    %Ñ­»·
% plot(cv2,'-xg');
% % hold on 
cv3 = ClassicalJacobi(dim)   %¹Åµä
plot(cv3,'-ok')
