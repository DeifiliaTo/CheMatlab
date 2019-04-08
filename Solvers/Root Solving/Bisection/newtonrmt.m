function[zn]=newtonrmt(fun,xrg,xg,tol)
%(fun,[0 100],1e-2,1e-14)
xl = xrg(1);
xr = xrg(2);
zn = zeros(1000, 1); %Initialize for an arbitrary (excessive) number of zs
fdx = (xr-xl)/1000;
intervals = IncrementalSearch(fun, xl, xr, dx); %Returns a 2D array of the xl and xr bounds
NumPoints = length(intervals);
nrf = 0; %Number of roots found
dyold = 1e10;   %Arbitrarily large number used for singularity check
h = 1e-4;
for i = 1:NumPoints %Iterate through the number of points found w/ inc search|| Does NR method work by using inc search for all
    iteration = 0;
    x1 = intervals(i, 1);
    x2 = intervals(i, 2);
    y1 = feval(fun, x1);
    y2 = feval(fun, x2);
    xg = (x1*y2-x2*y1)/(y2-y1); %make initial x guess with linear interpolation
    nrfail = 0;
    yold = feval(fun, xg);
    check = 1;
    while (check>tol)           %While the error is greater than a specified tolerance, iterate again
        iteration = iteration + 1;
        ynew = feval(fun, xg);
        fDer = (-1*feval(fun, xg+2*h)+8*feval(fun, xg+h)-8*feval(fun, xg-h)+feval(fun, xg-2*h))/(12*h);     %approximate derivative with a five-point stencil
        xn = xg-ynew/fDer;  %Make guess of new x value
        if (xn < x1 || xn > x2 || iteration > 10 || abs(fDer) < 1e-10)  %If we have stalled convergence, or if xn is out of the bounds of the interval
            nrfail = 1;     %Flag that NR method has failed
            break;
        end
        dy = abs(yold-ynew);
        if dy>dyold         %singularity check
            nrfail = 1;
            break
        end
        
        if (abs(xn) <= 1)   %Solve for error
            check = abs(xg-xn);
        else
            check = abs(1-xg/xn);
        end
        yold = feval(fun, xg);
        xg = xn;            %Set new guess
    end
    if (nrfail == 1)        %If the NR method failed, call the bisection method on the same interval
        [rt flag] = bisection(fun, intervals(i, 1), intervals(i, 2), tol);
        if flag == 0        %If the bisection method finds a root, store the root. Else, do nothing
            nrf = nrf + 1;
            zn(nrf) = rt;
        end
        
    else
        nrf = nrf + 1;      %If the NR method does not fail, store root
        zn(nrf) = xg;
    end
end
zn((nrf + 1):1000) = [];
end