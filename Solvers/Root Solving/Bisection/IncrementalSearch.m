function intervals = IncrementalSearch(f, x_0, x_f, h)
%Returns the bounds of the number of roots that it found in a 2D array
    intervals = zeros(1000, 2);     %Initializes intervals for arbitrarily large number
    index = 1;
    y_old = feval(f, x_0-h);   
    x_cur = x_0;
    while (x_cur < x_f)             %While we're still in the bounds of the interval
        y_new = feval(f, x_cur);    %Solve for new y value
         if y_old*y_new < 0         %If there is a sign change within the interval, store bounds 
            intervals(index, 1) = x_cur - h;    
            intervals(index, 2) = x_cur;
            index = index + 1;
         end
         y_old = y_new;             %Increment bounds of x, change respective y values
         x_cur = x_cur + h;
    end
    intervals(index: size(intervals, 1), :) = [];
    
end