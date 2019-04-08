function [x y] = RK4thOrder(x0, timestep, totalTime, CA0, k, tau)

t=0;
x = zeros(2, 1);
y(:,1) = x0;
numIter = round(totalTime/timestep);

for i = 2:numIter
    t = t + timestep;
    x(i) = t;    
    K1 = timestep*fneval(y(:,i-1), CA0, k, tau);
    K2 = timestep*fneval(y(:,i-1)+K1/2, CA0, k, tau);
    K3 = timestep*fneval(y(:,i-1)+K2/2, CA0, k, tau);
    K4 = timestep*fneval(y(:,i-1)+K3, CA0, k, tau);
    y(:,i) = y(:,i-1) +1/6* (K1+2*K2+2*K3+K4);
end

end
