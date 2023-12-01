function hw2_485_problem4

% Problem (a):
S1 = generate_data;
hold on
plot([0;S1(1,1)],[0,0]);
for m = 1:length(S1)-1
    plot([S1(1,m);S1(1,m+1)],[m,m],'color','b');
    plot([S1(1,m);S1(1,m)],[m-1,m],'color','b');
end
title("Plot for problem (a)")
hold off

figure
% Problem (b):
hold on
for q = 1:50
    Sq = generate_data;
    plot([0;Sq(1,1)],[0,0]);
    for m = 1:length(Sq)-1
        plot([Sq(1,m);Sq(1,m+1)],[m,m],'color','b');
        plot([Sq(1,m);Sq(1,m)],[m-1,m],'color','b');
    end
    q = q + 1;
end
title("Plot for problem (b)")
hold off

% Problem (c):
nt = [];

for c = 1:1000
    S50 = generate_data_50;
    nt(c) = length(S50);
    c=c+1;
end

disp("for t=50, IDC is:")
disp(var(nt(1,:))/mean(nt(1,:)));

nt = [];
for d=1:1000
    S90 = generate_data_90;
    nt(d) = length(S90);
    d =d +1;
end

disp("for t=90, IDC is:")
disp(var(nt(1,:))/mean(nt(1,:)));

% SCV of the H2 distribution is 1.1875, which is very close to the two IDC
% values above. 

end

function [S] = generate_data
sum1 = 0;
k = 1;
S = [];
S(k) = 0;
X = [];
X(k) = 0;
while sum1 <= 100
    if rand() < 0.6
        X(k+1) = exprnd(1,1);
        S(k+1) = S(k) + X(k+1);
        sum1 = S(k+1);
    else
        X(k+1) = exprnd(0.5,1);
        S(k+1) =S(k) + X(k+1);
        sum1 = S(k+1);
    end
k = k+1;
end
S = S(1,2:end-1);

end

function [S] = generate_data_50
sum1 = 0;
k = 1;
S = [];
S(k) = 0;
X = [];
X(k) = 0;
while sum1 <= 50
    if rand() < 0.6
        X(k+1) = exprnd(1,1);
        S(k+1) = S(k) + X(k+1);
        sum1 = S(k+1);
    else
        X(k+1) = exprnd(0.5,1);
        S(k+1) =S(k) + X(k+1);
        sum1 = S(k+1);
    end
k = k+1;
end
S = S(1,2:end-1);

end

function [S] = generate_data_90
sum1 = 0;
k = 1;
S = [];
S(k) = 0;
X = [];
X(k) = 0;
while sum1 <= 90
    if rand() < 0.6
        X(k+1) = exprnd(1,1);
        S(k+1) = S(k) + X(k+1);
        sum1 = S(k+1);
    else
        X(k+1) = exprnd(0.5,1);
        S(k+1) =S(k) + X(k+1);
        sum1 = S(k+1);
    end
k = k+1;
end
S = S(1,2:end-1);

end