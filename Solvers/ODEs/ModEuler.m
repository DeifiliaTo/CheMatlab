function [x y] = ModEuler (x0, timestep, totalTime, CA0, k, tau)
t=0;
x = zeros(2, 1);
y(:,1) = x0;
numIter = round(totalTime/timestep)

for i = 2:numIter
    x(i) = t;
    t = t + timestep;
    
    K1 = timestep*fneval(y(:,i-1), CA0, k, tau)
    K2 = timestep*fneval(y(:,i-1)+K1/2, CA0, k, tau)
    
    y(:,i) = y(:,i-1) +1/2* (K2+K1);
end

end
