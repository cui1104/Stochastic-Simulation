function hw3_485_7_11

summ = 0;

for j = 1:1000
    ind = simulation_7_11;
    summ =summ + ind;
end

disp(summ/1000);

end

function suc = simulation_7_11

initcap=25000;
suc = 1;
cap = initcap;

for day = 1:365
    cap = cap + 11000;

    ttlclaim =0;
    numclaim = poissrnd(10);

    for k = 1:numclaim
        ttlclaim = ttlclaim + exprnd(1000);
    end
    cap = cap - ttlclaim;
    if cap <= 0 
        suc = 0;
        break
    end

end
end