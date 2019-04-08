function cp = cp_integrate_input(species, Tzero, temperature ,form)
%TYPE 1: c_p = A+B((C/T)/(sinh(C/T))^2+D((E/T)/(cosh(E/T)))^2 [J/molK]

%TYPE 2: C_p = A+BT+CT^2+DT^3

%TYPE 3: c_p = A+BT+CT^2+DT^-2

T0 = Tzero
T = temperature
var = species; %Load in a structure
a = var.a
b = var.b
c = var.c
d = var.d
e = 0; %CHANGE THIS



if (form == 1)
    h = @(T) a+b((c./T)./(sinh(c./T))).^2+d.*((e./T)./(cosh(e./T))).^2;
    enth = integral(h, T0, T)
elseif (form == 2)
    h = @(T) a+b.*T+c.*T.^2+d.*T.^3
    enth = integral(h, T0, T)
   % enth = a*(T-T0)+b.*(T.^2-T0.^2)/2+c.*(T.^3-T0.^3)/3+d.*(T.^4-T0.^4)/4
elseif (form == 3)
    h = @(T) a+b.*T+c.*T.^2+d.*T.^(-2);
    enth = integral(h, T0, T)
end

println = ['From ',num2str(T0),' to ', num2str(T), ' K, the change in enthalpy is ', num2str(enth) ];
disp(println)
cp = enth;

