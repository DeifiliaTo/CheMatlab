function a = SwapRow (a, row1, row2)
%Given a matrix a, swaps the two rows of the matrix

TempRow = a(row2, :);
a(row2, :) = a(row1, :);
a(row1, :) = TempRow;

end