function hw7_problem3_485
simulation
end

function simulation
x = zeros(1,10000);
y = zeros(1,10000);
n = zeros(1,10000);

x(1) = 0;
y(1) = 0;
n(1) = 0;

for k = 2:3:9998
n(k) = generate_n(x(k-1), y(k-1));
x(k) = x(k-1);
y(k) = y(k-1);

y(k+1) = betarnd(x(k)+2, n(k)-x(k)+3);
x(k+1) = x(k);
n(k+1) = n(k);

x(k+2) = binornd(n(k+1),y(k+1));
n(k+2) = n(k+1);
y(k+2) = y(k+1);
end
disp("E[X] is "+mean(x));
disp("E[Y] is "+mean(y));
disp("E[N] is "+mean(n));
end

function n = generate_n(x,y)

u = rand(); p = 0; n = x;

while p <= u
 p = p + (((4*(1-y))^(n-x))*exp(-4*(1-y)))/factorial(n-x);
 n = n + 1;
end

end
