function hw4_485_last_problem

[D, N] = simulation(1000);
dbar = mean(D);
nbar = mean(N);
theta = dbar/nbar;

Y = [];

for r = 1:100

[Dbo, Nbo] = bootstrap(D,N,1000);
Y(r) = ((sum(Dbo)/sum(Nbo)) - theta)^2;

end

disp("average spending time is: "+theta)
disp("if we simulate 1000 days, MSE is approximately : "+ (sum(Y)/100))

[D, N] = simulation(100);
dbar = mean(D);
nbar = mean(N);
theta = dbar/nbar;

Y = [];

for r = 1:100

[Dbo, Nbo] = bootstrap(D,N,100);
Y(r) = ((sum(Dbo)/sum(Nbo)) - theta)^2;

end

disp("if we simulate 100 days, MSE is approximately : "+ (sum(Y)/100))

end

function [splist, ppl]=simulation(nrun)

otlist = [];
splist= [];
ppl = [];

for run = 1:nrun
ot=0;
A=[];D=[];

t=0;Na=0;Nd=0;n=0;

T0 = -(1/4)*log(rand());
ta=T0;
td=inf;

while true
    if ta<=td && ta<=8
        t = ta;
        if n <= 3
            Na = Na +1;
            n = n+1;
            ta = t + (-1/4)*log(rand());
            if n == 1
                td = t + (-1/4.2)*log(rand());
            end
            A(Na) = t;
        else
            Na = Na;
            n = n;
            ta = td + (-1/4)*log(rand());
        end

    elseif td < ta && td <= 8
        t = td;
        n = n-1;
        Nd = Nd +1;
        if n == 0
            td = inf;
        else
            td = t + (-1/4.2)*log(rand());
        end
        D(Nd) = t;
    elseif min(ta, td) > 8 && n>0
        t = td;
        n = n-1;
        Nd = Nd+1;
        if n > 0
            td = t + (-1/4.2)*log(rand());
        end
        D(Nd) = t;
    elseif min(ta,td) > 8 && n == 0
        Tp = max(t-8,0);
        break
    end

end
%if D(end)-9 > 0
%    ot = D(end)-9;
%else
%    ot = 0;
%end

%otlist(end+1) = ot;


sp = sum(D-A);
splist(end+1) = sp;

flw = length(D);
ppl(end+1) = flw;

end

end

function [D_boot, N_boot] = bootstrap(D,N,days)
D_boot=[];N_boot=[];

for j = 1:days
    ranum = randi([1 days]);
    D_boot(j) = D(ranum);
    N_boot(j) = N(ranum);
end

end
