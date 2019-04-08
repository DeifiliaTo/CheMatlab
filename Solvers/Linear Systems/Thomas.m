%% Implements Thomas' algorithm --> but rn the matrices
% are already set. Still need to automatically extract these values.

a = [0 1 3 2 4];
b = [2 2 -1 5 -3];
c = [1 -1 3 2 0];
d = [4 2 15 36 1];

n = length(a);
x = zeros(1,n);
p = x;
q = x;

p(1) = -c(1)/b(1);
q(1) = d(1)/b(1);

for i = 2:n
    bd = a(i)*p(i-1)+b(i);
    p(i) = -c(i)/bd;
    q(i) = (d(i)-a(i)*q(i-1))/bd;
end

% Back substitution
x(n) = q(n);
for i = n-1:-1:1
    x(i) = p(i)*x(i+1)+q(i);
end

%output
i = 1:n;
z = [i; x];
fprintf('x(%1.0f) = %8.6f\n', z)