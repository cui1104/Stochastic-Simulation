function hw2_485_problem6_2
NT = [];

for time = 1:1000
L=[];
L(1) = -log(rand());

    while L(end) <= 50
        lbd_star = find_lambda(L,L(end));
        t=0;
        while true
            t = t-(1/lbd_star)*log(rand());
            u = rand();
            if u <= (find_lambda(L,t)/lbd_star)
                L(end+1) = L(end) + t;
                break
            end
        end


    end

NT(time) = length(L)-1;

end

var(NT)/mean(NT)

NT = [];

for time = 1:1000
L=[];
L(1) = -log(rand());

    while L(end) <= 90
        lbd_star = find_lambda(L,L(end));
        t=0;
        while true
            t = t-(1/lbd_star)*log(rand());
            u = rand();
            if u <= (find_lambda(L,t)/lbd_star)
                L(end+1) = L(end) + t;
                break
            end
        end


    end

NT(time) = length(L)-1;

end

var(NT)/mean(NT)

end


function lambda = find_lambda(L, t)

lambda = 1;
for g = 1:length(L)
    lambda = lambda + 0.8*exp(-1.2*(t-L(g)));
end
    

end