function hw5_485_problem_4

[ropt1, ropt2] = raw_simulation
disp("Raw simulation has variance "+ropt2);
[copt1,copt2] = control_method
disp("Control variable method has variance "+copt2);
[aopt1, aopt2] = antithetic_method
disp("Antithetic variable method has variance "+aopt2);
end

function E = conditional_expect(x)
summ = 0;
for j = 0:19
    summ = summ + (((15/(0.5+x))^j)/factorial(j));
end
E = 1 - (summ * exp(-15/(0.5+x)));
end

function [rmean, rvar] = raw_simulation
thtlst = [];
for k = 1:10000
u = rand();
n = poissrnd(15/(0.5+u));
thtlst(k) = n>=20;
end
rmean = mean(thtlst);
rvar = var(thtlst);
end

function [cmean, cvar] = control_method
thtlst2=[];
elst = [];
ulst = [];
for m = 1:10000
    u = rand();
    ulst(m) = u;
    elst(m) = conditional_expect(u);
end
tmpmat = -cov(elst, ulst)/var(ulst);
cstar = tmpmat(1,2)

for k = 1:10000
u = rand();
thtlst2(k) = conditional_expect(u)+ cstar*(u-0.5);
end
cmean = mean(thtlst2);
cvar = var(thtlst2);
end


function [amean, avar] = antithetic_method
thtlst3=[];
for k = 1:10000
u = rand();
thtlst3(k) = 0.5*(conditional_expect(u)+conditional_expect(1-u));
end
amean = mean(thtlst3);
avar = var(thtlst3);
end
