function a = swap(a, p, q, rc)
% Swap rows or columns
    if (nargin == 3)
        rc = 'r'
    end 
    if (rc == 'r')
        SwapRow(a, p, q);
    else
        temp = a(:, q);
        a(:,q) = a(:, p);
        a(:, p) = temp;
    end

end