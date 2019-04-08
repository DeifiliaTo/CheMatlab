addpath('C:\Users\deifi\OneDrive - McGill University\CHEMATLAB\Solvers\Root Solving\Bisection')

%Properties for water
rho = 1000;
visc = 1e-3;
D = 0.1;
epsilon = 0.00006;
roughness = epsilon/D;
v=5;
%Re = rho v D / mu
Re = rho*v*D/visc;
fun = @(f) 1/sqrt(f)+2*log10(roughness/3.7+2.51/(Re*sqrt(f))); %Declares the transcendental equation in function form

[zn]=newtonrmt(fun,[0 1],1e-2,1e-10) %Solves for the roots with the NR method

%iterate through Re from 1000 to 1e8 & roughness from 1e-5 to 0.05
% [ 1e-5 2e-5 ... 4e-2 5e-2]
% [1000 2000 ... 1e8]'

for i = 1:10
    Re(i)  = i*1e3;
    Re(i+10) = i*1e4;
    Re(i+20) = i*1e5;
    Re(i+30) = i*1e6;
    Re(i+40) = i*1e7;
    Re(i+50) = i*1e8;
    roughness(i) = i*1e-5;
    roughness(i+10) = i*1e-4;
    roughness(i+20) = i*1e-3;
    roughness(i+30) = i*1e-2;
end
%% better spaced out initialization

counter = 1;
Re = linspace(1e3, 1e8, 1000);
roughness = linspace(1e-5, 5e-2, 1000);
    
%% Separate from initialization steps

for i = 1:length(Re)
    for j = 1:length(roughness)
      
        fun = @(f) 1/sqrt(f)+2*log10(roughness(j)/3.7+2.51/(Re(i)*sqrt(f)));
        zn = newtonrmt(fun,[0 1],1e-2,1e-10);
        FrictionFactor(i, j) =  zn(2); %Solves for the roots with the NR method
    end
end
