function der = ThreePtStencil_d(f, x, h)
%Finds the derivative with the three point stencil
    der = (feval(f,x+h)-feval(f,x-h))/(2*h);
end

