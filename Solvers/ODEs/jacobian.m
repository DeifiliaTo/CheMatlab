function j = jacobian(xg, CA0, k, tau)

    j = zeros(length(xg), length(xg));
    h = zeros(length(xg),1);
    for i = 1:length(j)
        h(i) = 0.001;
        j(:, i) = FivePtStencil_d(xg, h, CA0, k, tau);
        h(i) = 0;
    end
end