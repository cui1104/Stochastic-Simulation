function hw3_485_last_problem_b

hold on
[arrival, pepl] = generate_one_path;
plot(arrival, pepl,'color','b')
xx= generate_x;
plot(1:100,xx,'color', 'r')
title("number of customers in each time vs. X(t)")

hold off

meanN = [];temp = [];mean_50 = 0; var_50 = 0; mean_100=0; var_100=0;
for tim2 = 1:100
    temp = simulation(1000,tim2);
    if tim2 == 50
        mean_50 = mean(temp);
        var_50 = var(temp);
    end
    if tim2 == 100
        mean_100 = mean(temp);
        var_100 = var(temp);
    end
    meanN(tim2) = mean(temp);
end
figure
hold on
plot(1:100,xx,'color', 'r')
plot(1:100,meanN,'color','b')
title("average number of customers in each time over 1000 trials vs. X(t)")


hold off

% The plot of average of 1000 paths looks the same as the plot of X(t) over
% t from 1 to 100. Their average value is about the same. The first plot of
% only one path shares some similar patterns with the X(t) one as both of
% them have some cycles in the plot.
% The mean of number of customers at time 50 and 100 is about the same
% value as X(t). 

disp("mean at 50 is: ")
disp(mean_50)
disp("var at 50 is: ")
disp(var_50)
disp("mean at 100 is: ")
disp(mean_100)
disp("var at 100 is: ")
disp(var_100)

end

function [A, N] = generate_one_path
A = []; N = [];


ta = 0; td = 0; D=[];Np= 0;

while ta < 100
    ta = generate_next_arrival(ta);
    Np = Np + 1;
    A(Np) = ta;
    td = ta + generate_service_time;
    D(Np) = td;

    if ta > 100
        break
    end

end

if A(end) > 100
    A = A(1:end-1);
    D = D(1:end-1);
end



for j = 1:length(A)
ppl = 0;
for k = 1:length(A)
    if A(k)<A(j) && D(k) >A(j)
        ppl = ppl + 1;
    end
end

N(j) = ppl; 

end



end

function [tt] = generate_next_arrival(s)
tt = 0;
t = s;

t = t-(1/10)*log(rand());

u = rand();
if u <= ((5*sin(0.5*t)+5)/10)
    tt = t;
end

while u > ((5*sin(0.5*t)+5)/10)
    
    u = rand();
    t = t-(1/10)*log(rand());
    if u <= ((5*sin(0.5*t)+5)/10)
        tt = t;
        break
    end

end 

end

function pplist = simulation(trials, stoptm)

pplist = [];

for j = 1:trials

ta = 0; td = 0; A=[];D=[];N=0;

while ta < 100
    ta = generate_next_arrival(ta);
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
%disp("at "+stoptm+" mean is:")
%disp(mean(pplist))
%disp("var is:")
%disp(var(pplist))

end

function st = generate_service_time

u = rand();

if u<0.6
    st = exprnd(1);
elseif u>0.6
    st = exprnd(2);

end

end

function x = generate_x

x=[];

for t = 1:1:100
   f=@(s) (sin(0.5.*s).*3.*exp(-t+s))+(3.*exp(-t+s))+(sin(0.5.*s).*2.*exp(-0.5.*(t-s)))+(2.*exp(-0.5.*(t-s)));
   x(t)=integral(f,0,t);
end

end