function x = OneNorm(a)
%Returns the 1-norm of the given 2D matrix a. x is a double.
cols = size(a, 2);
x=0;
for i = 1:cols
    sumCol = sum(abs(a(:,i))); 
    if sumCol > x
        x = sumCol; %x becomes the max sum of columns
    end
end
end