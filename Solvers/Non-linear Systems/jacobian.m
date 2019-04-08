function j = jacobian(xg)
    j = zeros(length(xg), length(xg));
    h = zeros(length(xg),1);
    for i = 1:length(j)
        h(i) = 0.000001;
        j(:, i) = FivePtStencil_d(xg, h);
        h(i) = 0;
    end
end