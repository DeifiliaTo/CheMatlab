%% Note: Make sure variables are pre-loaded before running script.
%This function finds the change in energy using the heat of reaction
%method.

%Q = change in H = extent * \inc H_R + sum(OUTLET(n_i*h_i))-sum(INLET(n_i*h_i))

T0 = 25; %298 K or 25 C
T_in = 350;
T = 350; %Celcius

%% Form of cp equation. Form 1: sinh. Form 2: T^3. Form 3: T^-2.
form = 2;

%% CHANGE VARIABLES
extent = 3.4e-5;

%% STATE CHEM REACTION HERE. 
%% CO2 + 4 H2 -> CH4 + 2 H2O_v
object.aa = CO2;
object.bb = H2;
object.cc = CH4;
object.dd = H2O_g;

hfs = [hf.CO2 hf.H2 hf.CH4 hf.H2O_g]; 
stoich = [-1 -4 1 2];
mol_in = [3.34e-5 1.334e-4 0 0];
mol_out = [0 0 3.34e-5 6.7e-5];


%% STATE COEFFICIENT VALUES FOR CP HERE if they need to change


%% Begin automated script here.
HR = heat_of_reaction_input(hfs, stoich); %First term in variable

h_in = [cp_integrate_input(object.aa, T0, T_in, form) cp_integrate_input(object.bb, T0, T_in, form) cp_integrate_input(object.cc, T0, T_in, form) cp_integrate_input(object.dd, T0, T_in, form)] 
h_out = [cp_integrate_input(object.aa, T0, T, form) cp_integrate_input(object.bb, T0, T, form) cp_integrate_input(object.cc, T0, T, form) cp_integrate_input(object.dd, T0, T, form)]
hn_in = zeros(size(h_in,2), 1);
hn_out = zeros(size(h_out,2), 1);

for i = 1:size(h_in, 2)
    hn_in(i) = h_in(1,i)*mol_in(1,i);
    hn_out(i) = h_out(1,i)*mol_out(1,i);
end

Q = extent*HR+sum(hn_out)-sum(hn_in)

