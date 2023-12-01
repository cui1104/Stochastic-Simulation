function hw7_problem1_485 
simulation(10)
end

function simulation(B)

x = zeros(1,10000);
y = zeros(1,10000);

x(1) = 1;
y(1) = 1;

for k = 2:2:10000
tmp1 = exprnd(1/y(k-1));
while tmp1 >=B
    tmp1 = exprnd(1/y(k-1));
end
x(k) = tmp1;
y(k) = y(k-1);

tmp2 = exprnd(1/x(k));
while tmp2 >=B
    tmp2 = exprnd(1/x(k));
end
y(k+1) = tmp2;
x(k+1) = x(k);
end
disp("If B is "+B)
disp("E[X] is "+mean(x))
disp("E[XY] is "+mean(x.*y))
end