function hw2_485_problem1
% Method 1:
t=0;
n= 0;
while t < 1
    u1 = rand();
    u2 = rand();
    t = t - (1/5)*log(u1);
    if t > 1
        break
    else
    n = n + (19+ceil(21*u2));
    end
end

disp(n);

% Method 2:

N = poissrnd(5);
n = sum(ceil(19 + 21*rand(1,N)));
disp(n);


end
