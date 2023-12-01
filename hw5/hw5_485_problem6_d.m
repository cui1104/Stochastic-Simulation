function hw5_485_problem6_d
[opt1, opt2] = control_simulation;
disp("variance is "+opt2);
end

function [sp, sermi] = queue_simulation
ot=0;
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
sert = D(1)-A(1);
for j = 1:9
    if A(j+1) > D(j)
        sert = sert + (D(j+1)-A(j+1));
    elseif A(j+1) <= D(j) 
        sert = sert + (D(j+1)-D(j));
    end
end
sumi = 0;
for n =1:9
    sumi = sumi + (A(n+1)-A(n));
end
sermi = sert-sumi;
end

function [cstar, expv] = find_cstar
estlst = [];
ctrlst = [];
for k = 1:10000
    [est, ctrl] = queue_simulation;
    estlst(end+1) = est;
    ctrlst(end+1) = ctrl;
end
tmpmat = -cov(estlst, ctrlst)/var(ctrlst);
cstar = tmpmat(1,2);
expv = mean(ctrlst);
end


function [cmean, cvar] = control_simulation
thtlst = [];
[c, ex] = find_cstar;
for k =1:10000
    [T, S] = queue_simulation;
    thtlst(end+1) = T + c*(S-ex);
end
cmean = mean(thtlst);
cvar=var(thtlst);
end