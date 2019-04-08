%TYPE 1: c_p = A+B((C/T)/(sinh(C/T))^2+D((E/T)/(cosh(E/T)))^2 [J/molK]

%TYPE 2: C_p = A+BT+CT^2+DT^3

%TYPE 3: c_p = A+BT+CT^2+DT^-2

form = 2;
var = AIR; %Load in a structure
a = var.a;
b = var.b;
c = var.c;
d = var.d;
e = 0; %CHANGE THIS

T0 = 234.95;
T = 229.45;
R = 8.314;
P1 = 101000;
P2 = 100100;

if (form == 1)
    units = 'J/mol'
    h = @(T) a+b((c./T)./(sinh(c./T))).^2+d.*((e./T)./(cosh(e./T))).^2;
    ent = integral(h, T0, T)
    
elseif (form == 2)
    units = 'J/K';
    s = @(T) a./T+b+c.*T+d.*T.^2;
    ent = integral(s, T0, T) - R*log(P2/P1);
    ent = ent*1000;
elseif (form == 3)
    h = @(T) a+b.*T+c.*T.^2+d.*T.^(-2);
    ent = integral(h, T0, T)
end

%println = ['From ',num2str(T0),' to ', num2str(T), ' K, the change in entropy is ', num2str(ent), units ];
%disp(println)
ent
cp = ent;


