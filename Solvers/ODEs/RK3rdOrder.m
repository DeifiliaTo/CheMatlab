function [x y] = RK3rdOrder (x0, timestep, totalTime, CA0, k, tau)

x = zeros(2, 1);
y(:,1) = x0
t = 0;
numIter = round(totalTime/timestep)

for i = 2:numIter
    t = t + timestep;
    x(i) = t;
    K1 = timestep*fneval(y(:,i-1), CA0, k, tau);
    K2 = timestep*fneval(y(:,i-1)+K1/2, CA0, k, tau);
    K3 = timestep*fneval(y(:, i-1)-K1+2*K2, CA0, k, tau);
    y(:,i) = y(:,i-1) +1/6* (K1+4*K2+K3);
end
end

