%% Initial
%addpath
%x0 = [0 0 0 0 1];
CA0 = 20;
timestep = 0.01;
 k = 0.2;
 tau = 5;
 totalTime = 10;
 h=0.01;
 
 %y0 =  -1;
 %t = 0;
 % For Q5
x0 = [9.890106 8.621206 4.743581 10.249014 1];
 %x0 = [9.815 7.473 4.540 7.335 1]
 %x0 = [9.997971 9.800154 4.991224 13.926795 1];
% x0 = [y0 t];
close all;
tol = 1e-8;
 %method = 1; % Improved Euler's
 %method = 2; % Modified Euler's
 %method = 3; % 3rd Order
 %method = 4; % 4th Order
 %method = 5; % Butcher's Method
 %method = 6; % Implicit Euler
% method = 7; % Trapezoidal

method = 8;

if (method == 1) %Implicit Euler
    [x y] =ImpEuler(x0, timestep, totalTime, CA0, k, tau)
elseif (method == 2) %Modified Euler
   [x y] = ModEuler(x0, timestep, totalTime, CA0, k, tau)
elseif (method == 3) %3rd Order
    [x y] = RK3rdOrder(x0, timestep, totalTime, CA0, k, tau);
elseif (method == 4) % 4th order
    [x y] = RK4thOrder(x0, timestep, totalTime, CA0, k, tau);
elseif (method == 5) % 5th order
    [x y] = Butchers(x0, timestep, totalTime, CA0, k, tau);
elseif (method == 6) % Implicit Euler
    [x y] = ImplicitEuler(x0, tol, timestep, totalTime, CA0, k, tau);
elseif (method == 7) % Trapezoidal
    [x y] = Trapezoidal(x0, tol, timestep, totalTime, CA0, k, tau);
elseif (method == 8) % Backwards Euler
    [x y] = BackwardsEuler(x0, tol, timestep, totalTime, CA0, k, tau);
end

for i = 1:4 %modified for question 6
    hold on;
    plot (x, y(i, :))
end

legend ('CA1', 'CB1', 'CA2', 'CB2')

%% Locate concentration given time
targetTime = 2; %2 min. Change this!
if targetTime < x(1) 
    error('Target time occurs before start time. This is bad!')
elseif targetTime > x(length(x))*timestep
    error('Target time is outside of the interval. Run the sim for longer!')
else
    spot = targetTime/timestep;
    conc = (y(:, spot))
end

%% Max / min value
ifMax = 1;  % automatically finds the max. Else, finds min
targetSpecies = 2; %1 = CA1, 2 = CB1, 3 = CA2, 4 = CB2;
if ifMax
    [maxConc time] = max(y(targetSpecies,:));
else
    [minConc time] = min(y(targetSpecies, :));
end
conc = (y(:, time))
time = time * timestep


%% Find steady state
CA0 = 20;
k = 0.2;
tau = 5;
h = 0.01;
tol = 1e-8;
x0 = [0 0 0 0]
[xn, i] = newtonraphson( x0, tol, CA0, k, tau);
res = fnevalSteady(xn, CA0, k, tau);
xn


