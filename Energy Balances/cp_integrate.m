%TYPE 1: c_p = A+B((C/T)/(sinh(C/T))^2+D((E/T)/(cosh(E/T)))^2 [J/molK]

%TYPE 2: C_p = A+BT+CT^2+DT^3

%TYPE 3: c_p = A+BT+CT^2+DT^-2

form = 2;
var = NOA; %Load in a structure
a = var.CO2;
b = var.H2;
c = var.CH4;
d = var.d;
e = 0; %CHANGE THIS

T0 = 298;
T = 573;

if (form == 1)
    units = 'J/mol'
    h = @(T) a+b((c./T)./(sinh(c./T))).^2+d.*((e./T)./(cosh(e./T))).^2;
    enth = integral(h, T0, T)
    
elseif (form == 2)
    units = 'kJ/mol'
    h = @(T) a+b.*T+c.*T.^2+d.*T.^3;
    enth = integral(h, T0, T)
elseif (form == 3)
    h = @(T) a+b.*T+c.*T.^2+d.*T.^(-2);
    enth = integral(h, T0, T)
end

println = ['From ',num2str(T0),' to ', num2str(T), ' K, the change in enthalpy is ', num2str(enth), units ];
disp(println)
cp = enth;


