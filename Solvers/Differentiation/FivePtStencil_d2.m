function der = FivePtStencil_d2(f, x, h)
%Finds the second derivative with the five point stencil
    der = (-feval(f, x+2*h)+16*feval(f, x+h)-30*feval(f, x)+16*feval(f, x-h)-feval(f, x-2*h))/(12*h^2);
end

