function ders = FivePtStencil_d(x, h)
ders = zeros(length(x), 1);
if (size(x, 2) ~= 1)
    x = x'; %dummy proofing my code
end
%Finds the derivative with the five point stencil
    ders = (-fneval(x+2*h)+8*fneval(x+h)-8*fneval(x-h)+fneval(x-2*h))/(12*max(h));
end

