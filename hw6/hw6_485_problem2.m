function hw6_485_problem2

format long

summ = 0;
for k = 17:40
tmp = nchoosek(40,k)*(0.2^k)*(0.8^(40-k));
summ = summ + tmp;
end

summ % use binomial distribution for checking 
simulation

end

function simulation
inds = zeros(1,10000);
for s = 1:10000
s40tmp = generate_s40;
if s40tmp >= 17
    inds(s) = ((23/68)^s40tmp)*((0.2*(68/23)+0.8)^40);
else
    inds(s) = 0;
end
end
mean(inds)
end

function s40 = generate_s40

s40 = 0;

for k = 1:40
    u = rand();
    if u < (17/40)
        tmp = 1;
    else
        tmp = 0;
    end
s40 = s40 + tmp;
end

end
