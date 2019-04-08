function enthalpysolver 

R = 8.314e-3;
%In order of [H2 CO] (IN CELCIUS) Cp = [kJ/(mol K)]
A = [0.026868 1.702*R 3.249*R 3.376*R]
B = [0.1659e-3 9.081e-3*R 0.422e-3*R 0.557e-3*R]
C = [-4.179e-8 -2.164e-6*R 0 0]
D = [0 0 0.083e5*R -0.031e5*R]

v = [-1 1 1 1];

%h = dot(H, v)
a = dot (A, v)
b = dot(B, v)
c = dot(C, v)
d = dot(D, v)

T0 = 25+273;
T = 650+273;

    H =  a*(T-T0) + b/2*(T^2-T0^2) + c/3*(T^3-T0^3) - d*(1/T-1/T0) -5.14

end