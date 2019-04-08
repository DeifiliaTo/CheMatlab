function [loc mid] = bisection_recursive(arr, target, left, right, tol)
%Binary search method implemented using recursion

mid = ceil((right+left)/2);
if target > z(mid) && abs(1-arr(mid)/target) > tol && left < right
    [loc mid] = bisection_recursive(arr, target, mid+1, right, tol);
elseif target < arr(mid) && abs(1-arr(mid)/target) > tol && left < right
    [loc mid] = bisection_recursive(arr, target, mid-1, tol);
elseif abs(1-arr(mid)/target) < tol
    loc = arr(mid);
else
    error('value not found')
end