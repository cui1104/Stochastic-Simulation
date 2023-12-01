function hw5_485_problem_6

[ropt1, ropt2] = raw_simulation;
disp("variance is "+ropt2);
end

function [sp, ulst] = queue_simulation
ot=0;
ulst = [];
A=[];D=[];
t=0;Na=0;Nd=0;n=0;
ulst(end+1) = rand();
T0 = -(1/2)*log(ulst(end));
ta=T0;
td=inf;
while true
    if ta<=td && ta<=15
        t = ta;
        Na = Na +1;
        n = n+1;
        ulst(end+1) = rand();
        ta = t + (-1/2)*log(ulst(end));
        if n == 1
            ulst(end+1) = rand();
            td = t-1*log(ulst(end));
        end
        A(Na) = t;
    elseif td < ta && td <= 15
        t = td;
        n = n-1;
        Nd = Nd +1;
        if n == 0
            td = inf;
        else
            ulst(end+1) = rand();
            td = t -1*log(ulst(end));
        end
        D(Nd) = t;
    elseif min(ta, td) > 15 && n>0
        t = td;
        n = n-1;
        Nd = Nd+1;
        if n > 0
            ulst(end+1) = rand();
            td = t-1*log(ulst(end));
        end
        D(Nd) = t;
    elseif min(ta,td) > 15 && n == 0
        Tp = max(t-15,0);
        break
    end
end
D=D(1:10);
A=A(1:10);
sp = sum(D-A);
end

function [rmean, rvar]=raw_simulation
thtlst = [];
for k = 1:10000
    [spendtime, ulist] = queue_simulation;
    thtlst(k) = spendtime;
end
rmean = mean(thtlst);
rvar = var(thtlst);
end
