%Given a matrix of stoichiometric coefficients, and a matrix of hf values,
%find the heat of reaction in kJ/mol.
function heat_of_reaction
% 1 C6H6 + 7.5 O2 = 6 CO2 + 3 H2O
v = [-1 -9/2 2 3];
hfs = [hf.C2H6 hf.O2 hf.CO2 hf.H2O_l];
dot(v, hfs)
end