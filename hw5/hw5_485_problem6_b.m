function hw5_485_problem6_b
[aopt1, aopt2] = antithetic_method;
disp("variance this time is "+aopt2)
end

function [sp, ulsta, ulstd] = queue_simulation
ot=0;
ulsta = [];ulstd = [];
A=[];D=[];
t=0;Na=0;Nd=0;n=0;
ulsta(end+1) = rand();
T0 = -(1/2)*log(ulsta(end));
ta=T0;
td=inf;
while true
    if Na == 10 && n > 0
        t = td;
        n = n-1;
        Nd = Nd+1;
        if n > 0
            ulstd(end+1) = rand();
            td = t-1*log(ulstd(end));
        end
        D(Nd) = t;
    elseif Na == 10 && n == 0
        break
    elseif ta<=td && ta<=15
        t = ta;
        Na = Na +1;
        n = n+1;
        ulsta(end+1) = rand();
        ta = t + (-1/2)*log(ulsta(end));
        if n == 1
            ulstd(end+1) = rand();
            td = t-1*log(ulstd(end));
        end
        A(Na) = t;
    elseif td < ta && td <= 15
        t = td;
        n = n-1;
        Nd = Nd +1;
        if n == 0
            td = inf;
        else
            ulstd(end+1) = rand();
            td = t -1*log(ulstd(end));
        end
        D(Nd) = t;
    end
end
sp = sum(D-A);
end

function antispend = anti_queue_simulation(randa, randd)
ot=0;
A=[];D=[];
t=0;Na=0;Nd=0;n=0;
ua = 1 - randa(1);
T0 = -(1/2)*log(ua);
randa = randa(2:end);
ta=T0;
td=inf;
while true
    if Na == 10 && n > 0
        t = td;
        n = n-1;
        Nd = Nd+1;
        if n > 0
            ud = 1 - randd(end);
            td = t-1*log(ud);
        end
        D(Nd) = t;
    elseif Na == 10 && n == 0
        break
    elseif ta<=td && ta<=15
        t = ta;
        Na = Na +1;
        n = n+1;
        ua = 1 - randa(1);
        ta = t + (-1/2)*log(ua);
        randa = randa(2:end);
        if n == 1
            ud = 1- randd(1);
            td = t-1*log(ud);
            randd = randd(2:end);
        end
        A(Na) = t;
    elseif td < ta && td <= 15
        t = td;
        n = n-1;
        Nd = Nd +1;
        if n == 0
            td = inf;
        else
            ud = 1-randd(1);
            td = t -1*log(ud);
            randd = randd(2:end);
        end
        D(Nd) = t;
    end
end
antispend = sum(D-A);
end

function [amean, avar] = antithetic_method
thtlst2 = [];
for k = 1:10000
    [spendtime, ulista,ulistd] = queue_simulation;
    antitime = anti_queue_simulation(ulista, ulistd);
    thtlst2(end+1) = 0.5*(spendtime + antitime);
end
amean = mean(thtlst2);
avar = var(thtlst2);
end
