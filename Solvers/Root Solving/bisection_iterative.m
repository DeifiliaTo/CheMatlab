function [loc mid] = bisection_iterative (arr, target, tol)
    %Binary search method: NOTE - list must be sorted
    %arr = the array we're looking in
    %trying to find target
    right = length(arr);
    left = 1;
    mid = ceil((right+left)/2)
    check = 10; %arbitrary large number
    while check >= tol && right > left
        if target > arr(mid)
            left = mid + 1;
        else
            right = mid - 1;
        end
        mid = ceil((right+left)/2);
        check = abs(1-arr(mid)/target);
    end
    if check <= tol
        loc = arr(mid);
    else
        error ('value not found')
    end
    
end