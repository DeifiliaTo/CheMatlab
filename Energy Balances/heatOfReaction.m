%heatOfReaction
%Question 2c of CHEE 204 Assignment 1

v0 = [-1 1 1 1];
v1 = [-1 -5/2 1 2];
v2 = [-1 -1/2 1 0];
v3 = [-1 -7/2 3 2];

C2H2 = 226.7; %kJ/mol
H2 = 0;
O2 = 0;
H2O = -285.5;
CO2 = -393.5;
C2H6 = -84.7;
CH32O = -180.16;
CH4 = -74.8;
CO = -110.5;


rxn0 = [CH32O CH4 H2 CO];
rxn1 = [C2H2 O2 H2O CO2];
rxn2 = [H2 O2 H2O 0];
rxn3 = [C2H6 O2 H2O CO2];

h = [dot(v0, rxn0) dot(v1, rxn1) dot(v2, rxn2) dot(v3, rxn3)]
h4 = h(1) + 2*h(2) - h(3)