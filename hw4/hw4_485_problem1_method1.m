function hw4_485_problem1_method1

[mean10, var10] = simulation(1000)

end

function [a, b] = simulation(trials)

x10list=[];

for r = 1:trials
    currt = 0;
    stt = [];
    stt(1) = 0;

while currt < 10
if stt(end) == 0
    currt = currt + (-1/3)*log(rand());
    stt(end+1) = 1;
elseif stt(end) == 1
    u = rand();
    if u <= (2/5)
        currt = currt + (-1/2)*log(rand());
        stt(end+1) = 0;
    else
        currt = currt + (-1/3)*log(rand());
        stt(end+1) = 2;
    end
elseif stt(end) == 2
    u = rand();
    if u <= (4/7)
        currt = currt + (-1/2)*log(rand());
        stt(end+1) = 1;
    else
        currt = currt + (-1/3)*log(rand());
        stt(end+1) = 3;
    end
elseif stt(end) == 3
    u = rand();
    if u <= (4/7)
        currt = currt + (-1/2)*log(rand());
        stt(end+1) = 2;
    else
        currt = currt + (-1/3)*log(rand());
        stt(end+1) = 4;
    end
elseif stt(end) == 4
    u = rand();
    if u <= (4/7)
        currt = currt + (-1/2)*log(rand());
        stt(end+1) = 3;
    else
        currt = currt + (-1/3)*log(rand()); 
        stt(end+1) = 5;
    end
elseif stt(end) == 5
    currt = currt + (-1/2)*log(rand());
    stt(end+1) = 4;
end

end

x10list(end+1) = stt(end-1);

end
a=var(x10list);
b=mean(x10list);

end
