function x = fneval (x0)
%stack function. Returns the values of the functions.
  A = 2;
  B = 3;
  x1a = x0(1);
  x1b = x0(2);
 
  marg_one = @(x)((A+2*(B-A)*x)*((1-x)^2));
  marg_two = @(x)((B+2*(A-B)*(1-x))*x^2);
 
  f = @(xa, xb) marg_one(xa)-marg_one(xb)+log(xa/xb);
  g = @(xa, xb) marg_two(xa)-marg_two(xb)+log((1-xa)/(1-xb));
  x = [f(x1a, x1b) g(x1a, x1b)];
  x = x';
end