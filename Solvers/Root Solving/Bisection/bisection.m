function [rt flag] = bisection(fun, x1, x2, tol)
    y1 = feval(fun, x1);
    y2 = feval(fun, x2);
    flag = 0;
    dyold = 1e10;
    yold = y1;
    while (abs(1-x1/x2) > tol) %While the relative tolerance is greater than an indicated tolerance value
        x3 = (x1+x2)/2; %Find the midpoint of the boundaries
        y3 = feval(fun, x3);
        if (y1*y3 < 0) %If the root is in the left half of the interval, change the bounds of the interval
            x2 = x3;
            y2 = y3;
            ynew = y2;  %Used for singularity check
        else            %If the root is in the right half of the interval, change bounds of the interval
            x1 = x3;
            y1 = y3;
            ynew = y1;
        end
        dy = abs(yold-ynew);    
        if dy>dyold     %Singularity check
            flag = 1;   %Flag the singularity
            break
        end
        yold = feval(fun, x3);
    end
    rt = x3;    %Store the position of the root or the singularity
        
end