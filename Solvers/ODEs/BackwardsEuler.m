function [x yfin] = BackwardsEuler(x0, tol, h, totalTime, CA0, k, tau)
x0=x0';
y(:,1) = x0;

numIter = round(totalTime/h);
x = zeros(1, numIter);

y(:, 2) = y(:, 1);
x(numIter) = totalTime;
for i = numIter:-1:1
    y(:, 2) = y(:, 1) + fneval(y(:,2), CA0, k, tau)*h;
    if (i > 1)
        x(i-1) = x(i)-h;
    end
    check = 1;
    while (check > tol)
        Jy = jacobian(y(:,2), CA0, k, tau);
        sizeId = length(x0);
        I = id(sizeId);
        J = I-h*Jy;
        R = y(:, 2) - y(:, 1) - h*fneval(y(:, 2), CA0, k, tau);
        aug = [J -R];
        delta = GaussianElim(aug);
        check = sum(abs(delta))/length(x0);
%        y(:, 1) = y(:, 2);
        y(:, 2) = y(:, 2) + delta;
    end
    yfin(:, i) = y(:, 2);
    y(:, 1) = y(:, 2);
end
end