function hw3_485_problem1
simulation(100)
simulation(1000)
end

function simulation(nrun)
otlist = [];
splist= [];
ppl = [];

for run = 1:nrun
ot=0;
A=[];D=[];

t=0;Na=0;Nd=0;n=0;

T0 = -(1/10)*log(rand());
ta=T0;
td=inf;

while true
    if ta<=td && ta<=9
        t = ta;
        Na = Na +1;
        n = n+1;
        ta = t + (-1/10)*log(rand());
        if n == 1
            td = t + gamrnd(3,(1/40));
        end
        A(Na) = t;
    elseif td < ta && td <= 9
        t = td;
        n = n-1;
        Nd = Nd +1;
        if n == 0
            td = inf;
        else
            td = t + gamrnd(3,(1/40));
        end
        D(Nd) = t;
    elseif min(ta, td) > 9 && n>0
        t = td;
        n = n-1;
        Nd = Nd+1;
        if n > 0
            td = t + gamrnd(3,(1/40));
        end
        D(Nd) = t;
    elseif min(ta,td) > 9 && n == 0
        Tp = max(t-9,0);
        break
    end

end
if D(end)-9 > 0
    ot = D(end)-9;
else
    ot = 0;
end

otlist(end+1) = ot;

sp = sum(D-A);
splist(end+1) = sp;

flw = length(D);
ppl(end+1) = flw;

end

disp("for "+nrun+" runs,")
disp("average spend time is "+sum(splist)/sum(ppl))
disp("average overtime is "+sum(otlist)/length(otlist))
end

