function hw2_485_problem3

xsum = 0;
N = 0;

% set up all the x we need 
while xsum <= (25*pi)
    N = N + 1;
    x(N) = -log(rand());
    xsum = xsum + x(N);
end

% generate all the R we need
for i = 1:N-1
    R(i) = sqrt((sum(x(1:i)))/pi);
end

rh = 2*pi*rand(1,N-1);
polarplot(rh,R,"*");
end
