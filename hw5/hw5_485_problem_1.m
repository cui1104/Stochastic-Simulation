function hw5_485_problem_1

orig = [];
for k = 1:10000
    u = rand(1,5);
    orig(k) = sum((-5:-1).*log(u))>=21.6;   
end

anti = [];
for k = 1:10000

u = rand(1,5);
anti(k) = 1/2*(sum((-5:-1).*log(u))>=21.6)+(1/2)*(sum((-5:-1).*log(1-u))>=21.6);

end

mean(orig)
mean(anti)
var(orig)
var(anti)
end
