function hw3_485_last_problem_a

pplist_50 = simulation(1000,50);
pplist_100 = simulation(1000,100);

end

function pplist = simulation(trials, stoptm)

pplist = [];

for j = 1:trials

ta = 0; td = 0; A=[];D=[];N=0;

while ta < 100
    ta = ta + (-1/10)*log(rand());
    N = N + 1;
    A(N) = ta;
    td = ta + generate_service_time;
    D(N) = td;

    if ta > 100
        break
    end

end

if A(end) > 100
    A = A(1:end-1);
    D = D(1:end-1);
end

ppl = 0;

for k = 1:length(A)
    if A(k)<stoptm && D(k) >stoptm
        ppl = ppl + 1;
    end
end

pplist(end+1) = ppl;

end
disp("at "+stoptm+" mean is:")
disp(mean(pplist))
disp("var is:")
disp(var(pplist))


end

function st = generate_service_time

u = rand();

if u<0.6
    st = exprnd(1);
elseif u>0.6
    st = exprnd(2);

end

end