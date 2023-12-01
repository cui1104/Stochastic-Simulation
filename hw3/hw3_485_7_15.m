function hw3_485_7_15

disp(simulation(0.5, 5,1000))

end

function meant = simulation(alpha, C, k)

ttlt = 0;

for j = 1:k
t =0;
N =1;
ttldmg = 0;

A=[]; % arrival time of shocks
XI=[]; % initial damages


while ttldmg <= C
    ttldmg = 0;
    t = t + (-1)*log(rand()); % new arrival of shock
    A(N) = t;
    XI(N) = gamrnd(2,1);
    
    for i = 1:N
        ttldmg = ttldmg + XI(i)*exp(-alpha*(t-A(i)));
    end

    N = N + 1;
    if ttldmg > 5
        break
    end
end

ttlt = ttlt + t;

end

meant = ttlt/k;


end