function [x] = GaussianElim(a)
%x is array of x1 x2 ... xn
% A is augmented matrix a|b

% Check dimensions
mn = size(a);
m = mn(1);
n = mn(2);

if m + 1 ~= n % Make sure matrix is a square
    error('The matrix is not a square!')
end

initMatrix = a(1:m,1:m);    %Store the initial matrix

s = zeros(m,1);

for i = 1:m %Fill the SRP
    max = a(i,1);
    s(i) = max;
    for j = 1:m
        if a(i,j) > s(i)
            s(i) = a(i,j);
            max = s(i);
        end
    end
end

b = zeros(m, 2*m+1);
b(:,1:m) = a(:,1:m);
b(:,2*m+1) = a(:,m+1);
for i = 1:m
    b(i, i+m) = 1;
end
for k = 1:m-1 %Look to see if there is a better row to reduce first
    max_r = abs(b(k,k))/s(k);
    r = k;
    for j = k:m
        if abs(b(j,k))/s(j) > max_r
            max_r = abs(b(j,k))/s(j);
            r = j;
        end
    end
    if (r ~= k) %If there is a better row, swap them
        temp = b(k, :);
        b(k, :) = b(r,:);
        b(r,:) = temp;
        temp = s(k);
        s(k) = s(j);
        s(j) = temp;
    end
    for i = k+1:m %For all rows beneath the pivot, reduce.
        p = b(i,k)/b(k,k);
        b(i,:) = b(i,:) - b(k,:)*p;
    end
end

c =  b(:,2*m+1);

x = zeros(m,1); %Calculate final independent variables
x(m) = c(m)/b(m,m);
for j = m-1:-1:1
    x(j) = (c(j)-b(j,j+1:m)*x(j+1:m))/b(j,j);
end
end