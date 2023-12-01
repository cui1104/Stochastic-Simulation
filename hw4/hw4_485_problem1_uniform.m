function hw4_485_problem1_uniform

[mean10, var10] = simulation_uniform(1000)

end

function [a,b] = simulation_uniform(trials)

x10lists = [];

for i = 1:trials

currt = 0;
stt = [];
stt(1) = 0;

while currt <10
    if stt(end) == 0
        currt = currt + (-1/8)*log(rand());
        u =rand();
        if u <= 3/8
            stt(end+1) = 1;
        else
            stt(end+1) = 0;
        end
    elseif stt(end) == 1
        currt = currt + (-1/8)*log(rand());
        u = rand();
        if u <= 2/8
            stt(end+1) = 0;
        elseif u> (2/8) && u<= (5/8)
            stt(end+1) = 2;
        elseif u > (5/8) && u <1
            stt(end+1) = 1;
        end
    elseif stt(end) == 2 || stt(end) == 3 || stt(end)==4
        currt = currt + (-1/8)*log(rand());
        u = rand();
        if u <= 4/8
            stt(end+1) = stt(end) - 1;
        elseif u> (4/8) && u <= (7/8)
            stt(end+1) = stt(end) + 1;
        elseif u > (7/8) && u < 1
            stt(end+1) = stt(end);
        end
    elseif stt(end) == 5
        currt = currt + (-1/8)*log(rand());
        u = rand();
        if u < 1/2
            stt(end+1) = 4;
        else
            stt(end+1) = 5;
        end
    end

end

x10lists(end+1) = stt(end);

end

a=mean(x10lists);
b=var(x10lists);

end