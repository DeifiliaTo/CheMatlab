function der = FivePtStencil_d(f, x, h)
%Finds the derivative with the three point stencil
    der = (-feval(f,x+2*h)+8*feval(f,x+h)-8*feval(f,x-h)+feval(f, x-2*h))/(12*h);
end

