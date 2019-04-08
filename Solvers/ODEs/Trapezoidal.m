function [x yfin] = Trapezoidal(x0, tol, h, totalTime, CA0, k, tau)
%    x0 = [ 0 0 0 0 0.1]';
if (size(x0, 1) == 1)
    x0 = x0';
end
y(:,1) = x0;
x(1) = h;
y(:, 2) = y(:, 1);

numIter = round(totalTime/h);
yfin(:, 1) = x0;
for i = 1:numIter-1
    if (i > 1)
        x(i) = x(i-1)+h;
    end
    y(:, 2) = y(:, 1) + (fneval(y(:, 1), CA0, k, tau)+fneval(y(:,2), CA0, k, tau))*h/2;
    check = 1;

    while (check > tol)
        Jy = jacobian(y(:,2), CA0, k, tau);
        
        sizeId = length(x0);
        I = id(sizeId);
        J = I-h*Jy/2;
        R = y(:, 2) - y(:, 1) - (fneval(y(:, 1), CA0, k, tau)+fneval(y(:,2), CA0, k, tau))*h/2;
        aug = [J -R];
        delta = GaussianElim(aug);
        check = sum(abs(delta))/length(x0);
        y(:, 2) = y(:, 2) + delta;
    end
    yfin(:, i) = y(:, 2);
    y(:, 1) = y(:, 2);
end
end