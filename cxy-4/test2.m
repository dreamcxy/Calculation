dim = 101;
format long;
% cv1 = ThresholdJacobi(dim) %��ֵ
% plot(cv1,'-ob');
% hold on;
% cv2 = LoopJacobi(dim)    %ѭ��
% plot(cv2,'-xg');
% % hold on 
cv3 = ClassicalJacobi(dim)   %�ŵ�
plot(cv3,'-ok')
