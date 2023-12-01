function hw5_485_problem_3

[rawopt1, rawopt2] = raw_method;
disp("By raw method, mean is "+rawopt1+", variance is "+rawopt2)
[copt1, copt2] = conditional_method;
disp("By conditional expectation method, mean is "+copt1+", variance is "+copt2)
[aopt1, aopt2] = antithetic_method;
disp("With an antithetic variable, mean is "+aopt1+", variance is "+aopt2)
[ctrlopt1, ctrlopt2] = control_method;
disp("With a control variable, mean is "+ctrlopt1+", variance is "+ctrlopt2)
disp("Theta is 0.5.")
end

function [rmean, rvar] = raw_method
thtlst = [];
for k = 1:10000
y = normrnd(1,1);
x = normrnd(y, 2);
thtlst(k) = x>1;
end
rmean = mean(thtlst);
rvar = var(thtlst);
end

function [cmean, cvar] = conditional_method
thtlst2 = [];
for k = 1:10000
y = normrnd(1,1);
thtlst2(k) = 1-normcdf((1-y)/2);
end
cmean = mean(thtlst2);
cvar = var(thtlst2);
end

function [amean, avar] = antithetic_method
thtlst3 = [];

for k = 1:10000
w1 = exprnd(1);
w2 = exprnd(1);
while w2-((w1-1)^2)/2 <= 0
w1 = exprnd(1);
w2 = exprnd(1);
end
u = rand();
if u <= 1/2
z1 = w1;
else
z1 = -w1;
end
z2=-z1;
y1 = 1+z1;
y2 = 1+z2;
thtlst3(k) = 0.5*((1-normcdf((1-y1)/2))+(1-normcdf((1-y2)/2)));
end
amean = mean(thtlst3);
avar = var(thtlst3);
end

function [ctrlmean, ctrlvar] = control_method

ylst = [];
vlst = [];
for m = 1:10000
    ylst(m) = normrnd(1,1);
    vlst(m) = 1-normcdf((1-ylst(m))/2);
end
tmpmat = -cov(vlst, ylst)/var(ylst);
cstar = tmpmat(1,2);

thtlst4 = [];
for k = 1:10000
    tmpy = normrnd(1,1);
    thtlst4(k) = 1 - normcdf((1-tmpy)/2) + cstar*(tmpy-1); 
end
ctrlmean = mean(thtlst4);
ctrlvar = var(thtlst4);

end