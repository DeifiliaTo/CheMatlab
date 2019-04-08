function x = fneval (x0, CA0, k, tau)
%stack function. Returns the values of the functions.

 CA1 = x0(1);
 CB1 = x0(2);
 CA2 = x0(3);
 CB2 = x0(4);
 
 
 dCA0 = 0;
  dCA1 = 1/tau*(CA0-CA1)-k*CA1;
  dCB1 = -1/tau*(CB1) + k*CA1;
  dCA2 = 1/tau*(CA1-CA2)-k*CA2;
  dCB2 = 1/tau*(CB1-CB2)+k*CA2;
  
%   y0 = x0(1);
%   t = x0(2);
%   dy = 5*exp(5*t)*(y0-t)^2+1;
%   
 
  %x = [CA0 CA1 CB1 CA2 CB2 time];
  x = [dCA1 dCB1 dCA2 dCB2 1];
 %x = [dy t];

  x = x';
end