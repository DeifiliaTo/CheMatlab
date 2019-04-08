%% Note: Make sure variables are pre-loaded before running script.
%This function finds the change in energy using the heat of reaction
%method.

%Q = change in H = extent * \inc H_R + sum(OUTLET(n_i*h_i))-sum(INLET(n_i*h_i))

T0 = 25; %298 K or 25 C
T_in = 25;
T = 300; %Celcius

%% Form of cp equation. Form 1: sinh. Form 2: T^3. Form 3: T^-2.
form = 2;

%% CHANGE VARIABLES

extent = 25;

%% STATE CHEM REACTION HERE. 
%% 4 NH3 + 5 O2 = 4 NO + 6 H2O
object.aa = NH3;
object.bb = O2;
object.cc = NO;
object.dd = H2O_g;

hfs = [hf.NH3 hf.O2 hf.NO hf.H2O_g]; 
stoich = [-4 -5 4 6];
mol_in = [100 200 0 0];
mol_out = [0 75 100 150];


%% STATE COEFFICIENT VALUES FOR CP HERE if they need to change


%% Begin automated script here.
HR = heat_of_reaction_input(hfs, stoich); %First term in variable

h_in = [cp_integrate_input(object.aa, T0, T_in, form)+object.aa.hf cp_integrate_input(object.bb, T0, T_in, form)+object.bb.hf cp_integrate_input(object.cc, T0, T_in, form)+object.cc.hf cp_integrate_input(object.dd, T0, T_in, form)+object.dd.hf] 
h_out = [cp_integrate_input(object.aa, T0, T, form)+object.aa.hf cp_integrate_input(object.bb, T0, T, form)+object.bb.hf cp_integrate_input(object.cc, T0, T, form)+object.cc.hf cp_integrate_input(object.dd, T0, T, form)+object.dd.hf]
hn_in = zeros(size(h_in,2), 1);
hn_out = zeros(size(h_out,2), 1);

for i = 1:size(h_in, 2)
    hn_in(i) = h_in(1,i)*mol_in(1,i);
    hn_out(i) = h_out(1,i)*mol_out(1,i);
end

Q = sum(hn_out)-sum(hn_in)

