function [x] = max1(u)
n = size(u,1);
a = u(1,1);
for i = 1:n
    if abs(u(i,1)) > a
        a = abs(u(i,1));
    end
end
for i = 1:n
    if u(i,1) == a
        x = a;
        break;
    else
        x = (-1)*a;
    end
end
end