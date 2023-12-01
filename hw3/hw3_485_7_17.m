function hw3_485_7_17
worth = [];

for k = 1:1000

p=[];
sp = 100;

p(1)=100;

for i = 2:20
    if p(i-1) <= 100
        p(i) = p(i-1) * exp(normrnd(-0.05,0.3));
    else
        sp = p(i-1);
        break
    end

    i = i + 1;
end

worth(end+1) = sp-100;

end

disp(mean(worth))

end