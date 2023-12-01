function hw6_485_problem1
format long
[x1,lower1,theta] = nim;
disp("By normalized importance sampling, result is "+theta);
[output2] = resampling(x1,lower1);
disp("By resampling method, result is "+output2);
end

function x = generate_x
while true
u = rand();
g = exp(-u)+(1/exp(1));
u1 = rand();
if u1<g
    x = u;
    break
else
    continue
end
end
end

function [x, lower, thetanim]=nim
upper=[];
lower=[];
x=[];
for k =1:10000
xi = generate_x;
gx = exp(-xi)+(1/exp(1));
fx = exp(xi+xi^2);
upper(end+1) = xi*fx/gx;
wi = fx/gx;
lower(end+1) = wi;
x(end+1) = xi;
end
thetanim = sum(upper)/sum(lower);
end

function [result] = resampling(x,lower)
wsum = sum(lower);
problst = lower/wsum;
cdf = [];
summ = 0;
for s = 1:10000
summ = summ + problst(s);
cdf(s) = summ;
end

resampleidx = zeros(1,10000);
for t = 1:10000
resampleidx(t) = onesample(cdf);
end

resamplex = x(resampleidx);
result = mean(resamplex);
end

function xidx = onesample(cdflist)
u = rand();
xidx=0;
for k = 1:(length(cdflist)-1)
if u < cdflist(1)
   xidx = 1;
   break
elseif u > cdflist(k) && u < cdflist(k+1)
    xidx = k+1;
    break;
end
k = k+1;
end

end

