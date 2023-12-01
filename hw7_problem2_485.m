function hw7_problem2_485
simulation
end

function simulation

x = zeros(1,10000);
y = zeros(1,10000);
z = zeros(1,10000);

x(1) = 1;
y(1) = 1;
z(1) = 1;

for k = 2:3:9998
x(k) = exprnd(1/(1+y(k-1)+z(k-1)));
y(k) = y(k-1);
z(k) = z(k-1);

x(k+1) = x(k);
z(k+1) = z(k);
y(k+1) = exprnd(1/(1+x(k)+z(k)));

x(k+2) = x(k+1);
y(k+2) = y(k+1);
z(k+2) = exprnd(1/(1+y(k+1)+x(k+1)));
end
disp("E[XYZ] is "+mean(x.*y.*z))
end