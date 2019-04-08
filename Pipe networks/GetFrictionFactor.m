%% Input: roughness, Reynold's number
function f = GetFrictionFactor(Reynolds, roughnessRatio)
addpath('C:\Users\deifi\OneDrive - McGill University\CHEMATLAB\Pipe networks');
load('FrictionFactor.mat');


%min epsilon
%min Re = 1000
% max Re = 1e8
%1000 values of each
%min roughness = 1e-5
%max roughness = 0.05

RePercent = round((Reynolds-1000)/(1e8-1000)*1000);
RoughPercent = round((roughnessRatio-1e-5)/(0.05-1e-5)*1000)
f = FrictionFactor(RePercent, RoughPercent);
end

