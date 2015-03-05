% wucha1 = zeros(26,1);
% wucha2 = zeros(26,1);
% wucha3 = zeros(26,1);
% wucha4 = zeros(26,1);
% for n = 5:30
%     [wucha1(n-4),wucha2(n-4),wucha3(n-4),wucha4(n-4)] = Ex615(n);
% end
% num = 5:30;
% plot(num,wucha1,'b.-')%MGS的
% hold on
% plot(num,wucha2,'rs-')%法方程组的
% hold on
% plot(num,wucha3,'b*-')%HouseHolder的
% hold on
% plot(num,wucha4,'bd-')%Givens的
time1 = zeros(26,1);
time2 = zeros(26,1);
time3 = zeros(26,1);
time4 = zeros(26,1);
for n = 5:30
    [time1(n-4),time2(n-4),time3(n-4),time4(n-4)] = Ex615(n);
end
num = 5:30;
plot(num,time1,'b.-')%MGS的
hold on
plot(num,time2,'rs-')%法方程组的
hold on
plot(num,time3,'b*-')%HouseHolder的
hold on
plot(num,time4,'bd-')%Givens的

