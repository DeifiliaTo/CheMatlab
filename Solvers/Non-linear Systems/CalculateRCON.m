function rcon = CalculateRCON(a)
    %This function calculates the rcon value of a matrix.
    %It starts by calculating the inverse of a.
    m = size(a,1);
    cof = zeros(m,m);
    if m > 1
        tmp = zeros(m-1, m-1); 
    end
    rowct = 1;
    colct = 1;
    for i = 1:m
        for j = 1:m
            for r = 1:m
                for c = 1:m
                    if (c ~= j && r ~= i)
                        tmp(rowct, colct) = a(r,c);
                        colct = colct + 1;
                    end
                end
                if (r ~= i)
                    rowct = rowct + 1;
                end
                colct = 1;
            end
            rowct = 1;
            cof(i,j) = det(tmp);
            tmp = zeros(m-1,m-1);
        end
    end
    adj = cof';
    inverse = (1/det(a(1:m, 1:m))).*adj;
    rcon = 1/(OneNorm(a(1:m,1:m))*OneNorm(inverse));
    
end