function [r, nrf]=incsearch(fun,xi,xf,dxo,tol)
% Finds all roots in the interval [xi xf]
% nrf==> number of roots found
% dxo==> intial increment
% tol==> tolerance
% copyright Phillip Servio 2010
xi=xi-dxo;
xold=xi; xnew=xold;
yold=feval(fun,xi);
xft=xf+dxo;
nrf=0;
r=zeros(1000,1);
while xnew <= xft
    dx=dxo; dyold=1e12; sing=0;
    while tol < dx && xnew <= xft
        xnew=xold + dx;
        ynew=feval(fun,xnew);
        if ynew == 0
            break
        elseif sign(ynew*yold)==1 || sign(ynew*yold)==0
            xold=xnew; yold=ynew;
        else
            dy=abs(yold-ynew);
            if dy>dyold
                sing=1;
                break
            end
            dx=dx/10;
        end
    end
    xold=xnew ; yold=feval(fun,xold);
    if sing == 0 && xnew <= xft
        nrf=nrf+1;
        r(nrf)=xnew;
        xold=xnew+tol;
    end
end
r(nrf+1:end)=[];