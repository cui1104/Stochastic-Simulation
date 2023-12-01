function hw4_485_problem2
n50list = [];

for m = 1:500

currt = 0;
checktm = [];
stt = [];
stt(1) = 0;
checktm(1) = 0;

while currt <50
    if stt(end) == 0
        currt = currt + (-1)*log(rand());
        checktm(end+1) = currt;
        u =rand();
        if u <= 1/2
            stt(end+1) = 0;
        else
            stt(end+1) = 1;
        end
    elseif stt(end) == 1
        currt = currt + (-1)*log(rand());
        checktm(end+1) = currt;
        u = rand();
        if u <= 1/4
            stt(end+1) = 0;
        else
            stt(end+1) = 1;
        end
    end

end

%checktm
%stt

sums = 0;
for k = 1:(length(checktm)-1)
    width = checktm(k+1)-checktm(k);
    if stt(k) == 0
        height = 1;
    elseif stt(k) == 1
        height = 2;
    end
    sums = sums + width * height;
end

n50list(end+1) = poissrnd(sums);

end

disp("idc is: ")
disp(var(n50list)/mean(n50list))


end
