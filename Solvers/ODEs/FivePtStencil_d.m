function ders = FivePtStencil_d(x, h, CA0, k, tau)
ders = zeros(length(x), 1);
if (size(x, 2) ~= 1)
    x = x'; %dummy proofing my code
end
%Finds the derivative with the five point stencil
ders = (-fneval(x+2*h, CA0, k, tau)+8*fneval(x+h, CA0, k, tau)-8*fneval(x-h, CA0, k, tau)+fneval(x-2*h, CA0, k, tau))/(12*max(h));
end

