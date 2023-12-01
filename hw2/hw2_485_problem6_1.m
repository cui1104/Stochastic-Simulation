function hw2_485_problem6_1
L=[];
L(1) = -log(rand());

while L(end) <= 100
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

L=L(1,1:end-1);
plot(L,1:size(L,2),"b");
title("Plot of N(t)");

figure
hold on
plot([0;L(1)],[1;1],"color","b");
plot([L(1) L(1)],[1 1+0.8],"b");

for k = 1:(length(L)-1)
y = 1;
x = [L(k):0.0001:L(k+1)];
for g = 1:k
    y = y + 0.8*exp(-1.2*(x-L(g)));
end
plot([x(end) x(end)],[y(end) (y(end)+0.8)],"b")
plot(x,y,"b");
end
title("Plot of lambda(t)");

hold off


end




function lambda = find_lambda(L, t)

lambda = 1;
for g = 1:length(L)
    lambda = lambda + 0.8*exp(-1.2*(t-L(g)));
end
    

end



