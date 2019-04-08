%% Note: Make sure variables are pre-loaded before running script.
%This function finds the change in energy using the heat of reaction
%method.

%0 = k + a'T_ad + B' T_ad^2 + C' T_ad^3 + D' T_ad^4

T0 = 298; %298 K or 25 C
T_in = 673;
conversion = 0.1;


%% Form of cp equation. Form 1: sinh. Form 2: T^3. Form 3: T^-2.
form = 2;

%% CHANGE VARIABLES
extent = 10;

%% STATE CHEM REACTION HERE. 
%% C2H5OH => CH3CHO + H2
object.aa = C2H5OH;
object.bb = CH3CHO;
object.cc = H2;


%% STATE COEFFICIENT VALUES FOR CP HERE if they need to change


%% Finding hf, mol, stoich coeffs
hfs = [object.aa.hf object.bb.hf object.cc.hf]; %kJ
stoich = [-1 1 1];
mol_in = [100 0 0];
mol_out = [90 10 10];

CR = dot(hfs, stoich)*extent %kJ


%% Find CI for inlet. CI = sum(ni*hi) = sum(ni*int(cp dT))
c = [cp_integrate_input(object.aa, T0, T_in, form)];
n = [mol_in(1)]
CI = dot(c, n)/1000; %kJ

EFn = @(n, A, B, C, D, T0) -1*n*(A*T0+B/2*T0^2+C/3*T0^3+D/4*T0^4)
E1 = EFn(mol_out(1), object.aa.a, object.aa.b, object.aa.c, object.aa.d, T0);
E2 = EFn(mol_out(2), object.bb.a, object.bb.b, object.bb.c, object.bb.d, T0);
E3 = EFn(mol_out(3), object.cc.a, object.cc.b, object.cc.c, object.cc.d, T0);
%E4 = EFn(mol_out(4), object.dd.a, object.dd.b, object.dd.c, object.dd.d, T0)
E = [E1 E2 E3]; %CHANGE TO E4 IF NECESSARY
E = sum(E)/1000; %kJ

K = CR-CI+E

%MATRICES SHOULD HAVE AS MANY COLUMNS AS SPECIES
A = [object.aa.a object.bb.a object.cc.a];
B = [object.aa.b object.bb.b object.cc.b];
C = [object.aa.c object.bb.c object.cc.c];
D = [object.aa.d object.bb.d object.cc.d];
%Start from D
%Convert ABCD from J to kJ.
coeff = [dot(D, mol_out)/4000 dot(C, mol_out)/3000 dot(B, mol_out)/2000 dot(A, mol_out)/1000 K]; %kJ
roots(coeff)