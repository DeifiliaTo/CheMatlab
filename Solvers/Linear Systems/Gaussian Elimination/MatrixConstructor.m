function a = MatrixConstructor (nStages, L, V, yinit, x0, alpha)
a = zeros(nStages, nStages+1);
bal = -(L/alpha+V);
for i = 1:nStages %Filling a
    if i == 1
        a(1, 1) = bal;
        a(1, 2) = V;
        a(1, nStages+1) = -L*x0;
    elseif i == nStages
        a(nStages, nStages-1) = L/alpha;
        a(nStages, nStages) = bal;
        a(nStages, nStages+1) = -V*yinit;
    else
        a(i, i-1) = L/alpha;
        a(i,i) = bal;
        a(i, i+1) = V;
    end
end
end