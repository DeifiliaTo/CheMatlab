function [x y] = Butchers(x0, timestep, totalTime, CA0, k, tau)

t=0;
y(:,1) = x0;
numIter = round(totalTime/timestep);

for i = 2:numIter
    t = t + timestep;
    x(i) = t;
    K1 = timestep*fneval(y(:,i-1), CA0, k, tau);
    K2 = timestep*fneval(y(:,i-1)+K1/4, CA0, k, tau);
    K3 = timestep*fneval(y(:,i-1)+K1/8+K2/8, CA0, k, tau);
    K4 = timestep*fneval(y(:,i-1)-K2/2+K3, CA0, k, tau);
    K5 = timestep*fneval(y(:,i-1)+3*K1/16+9*K4/16, CA0, k, tau);
    K6 = timestep*fneval(y(:,i-1)+1/7*(-3*K1+2*K2+12*K3-12*K4+8*K5), CA0, k, tau);
    y(:,i) = y(:,i-1) +1/90* (7*K1+32*K2+12*K3+12*K4+32*K5+7*K6);
end
end