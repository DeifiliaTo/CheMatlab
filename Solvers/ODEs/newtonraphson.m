function [xn, i] = newtonraphson(xg, tol, CA0, k, tau)

i = 0;
check = 1;
n = length(xg);
dyold = 1e10;
ov = ones(1, n);


%xg is a column vector

xg = xg(:);

while tol < check
    i = i + 1;
    j = jacobianSteady(xg, CA0, k, tau);
    f = fnevalSteady(xg, CA0, k, tau);
    deltax = [j -f];
    rcon = CalculateRCON(j);
    if (rcon < 1e-15)
        warning('RCON number is less than 10E-15. Solution is invalid.')
    end
    delta = GaussianElim(deltax);
    xn = xg + delta;
    dy = ov*abs(fnevalSteady(xn, CA0, k, tau)-f);
    if i > 100 
        warning ('Method failed, too many iterations required')
        break;
    elseif (dy > dyold && i > 1) 
        warning ('Method failed, slope is increasing')
        break
    elseif isreal(xn) == 0
        warning ('Method failed, guess found is not real ')
        break
    end
    check = ov*abs(xg-xn)/n;
    xg = xn;

end