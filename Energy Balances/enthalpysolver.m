function enthalpysolver 

%Units in kJ/(mol K)
A = [1.702 4.038 3.507 3.468];
B = [9.081e-3 3.47e-3 3.376e-3 3.249e-3];
C = [-2.164e-6 1.45e-6 0.557e-6 0.422e-6];


H  = [-180160 -74800 0 -110500];
A = [23.31 75.4 28.95 28.84];
B = [0.05469 0 0.00411 0.0000765];
C = [3.661e-6 0 3.548e-6 3.288e-6];
D = [-1.1e-8 0 -2.22e-9 -8.698e-10];

%Question 3c)
%In order of [(CH3)2O, CH4]; (In KELVIN) Cp = [kJ/mol(K)]
A = [0.02686 19.87e-3];
B = [1.659e-4 5.021e-5];
C = [-4.179e-8 1.268e-8];
D = [0 -11e-12];

v = [-1 1];

a = dot (A, v);
b = dot(B, v);
c = dot(C, v);
d = dot(D, v);

T0 = 25+273;
T = 650 + 273;
H = 0;

%In kJ
    H = a*(T-T0) + b/2*(T^2-T0^2) + c/3*(T^3-T0^3) + d/4*(T^4-T0^4)
    


%In order of [H2 CO] (IN CELCIUS) Cp = [kJ/(mol K)]
A = [28.82e-3 28.95e-3];
B = [0.00765e-5 0.411e-5];
C = [0.3288e-8 0.3548e-8]; 
D = [-0.8698e-12 -2.22e-12];

v = [1 1];

%h = dot(H, v)
a = dot (A, v);
b = dot(B, v);
c = dot(C, v);
d = dot(D, v);

T0 = 25;
T = 650;

    H = H + a*(T-T0) + b/2*(T^2-T0^2) + c/3*(T^3-T0^3) + d/4*(T^4-T0^4) -5.14

end