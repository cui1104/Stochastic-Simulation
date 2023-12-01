function hw5_485_problem6_e
[copt1, copt2]=conditional_simulation;
disp("variance is "+copt2);
end

function estm = queue_simulation
A=[];D=[];
t=0;Na=0;Nd=0;n=0;
T0 = -(1/2)*log(rand());
ta=T0;
td=inf;
while true
    if Na == 10 && n > 0
        t = td;
        n = n-1;
        Nd = Nd+1;
        if n > 0
            td = t-1*log(rand());
        end
        D(Nd) = t;
    elseif Na == 10 && n == 0
        break
    elseif ta<=td && ta<=15
        t = ta;
        Na = Na +1;
        n = n+1;
        ta = t + (-1/2)*log(rand());
        if n == 1
            td = t-1*log(rand());
        end
        A(Na) = t;
    elseif td < ta && td <= 15
        t = td;
        n = n-1;
        Nd = Nd +1;
        if n == 0
            td = inf;
        else
            td = t -1*log(rand());
        end
        D(Nd) = t;
    end
end
D=D(1:10);
A=A(1:10);
sp = sum(D-A);
Nlist = zeros(1,10);
Nlist(1) = 0;
for p = 2:10
    for k = 1:(p-1)
        if D(k) > A(p)
            Nlist(p) = Nlist(p)+1;
        end
    end
end
conexp = Nlist+1;
estm = sum(conexp);
end

function [cmean, cvar]=conditional_simulation
thtlst = [];
for k = 1:10000
    es = queue_simulation;
    thtlst(k) = es;
end
cmean = mean(thtlst);
cvar = var(thtlst);
end
