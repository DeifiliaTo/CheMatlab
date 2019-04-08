function der = ThreePtStencil_d2(f, x, h)
%Finds the second derivative with the three point stencil
    der = (feval(f,x+h)-2*feval(f,x)+feval(f,x-h))/(h^2);
end

