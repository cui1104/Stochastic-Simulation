function hw2_485_problem2
% Method 1:

t = 0;
I = 0;
S =[];
while t <= 10
    t = t-(1/26)*log(rand());
    u = rand();
    if t>10
        break
    elseif 5<t && t<10
        if u <= (5*t-24)/26
            I = I + 1;
            S(I) = t;
        end
    elseif 0<t && t<5
        if u<= t/130
            I = I + 1;
            S(I) = t;
    end
    end
end
disp(S(1:10));

% Method 2:
lmd(1:5) = 1;
lmd(6)=6;lmd(7)=11;lmd(8)=16;lmd(9)=21;lmd(10)=26;

t = 0;
J = 1;
I = 0;
S = [];

while J < 10
X = (-1/lmd(J))*log(rand());
if t + X > J
    if J == 10
        break
    else
        X = (X-J+t)*lmd(J)/lmd(J+1);
        t = J;
        J = J +1;
    end
else
    t = t+X;
    u = rand();
    if 0<t && t<5
        if u<= ((t/5) / lmd(J))
            I = I +1;
            S(I) = t;
        end
    elseif 5<t && t<10
        if u <= (5*t - 24) /lmd(J)
            I = I +1;
            S(I) = t;
        end
    end
end    
end

disp(S(1:10));

% Method 3:
S = [];
S(1) = 0;
for i = 2:11
    if S(i-1)+sqrt((S(i-1)^2)-10*log(1-rand()))-S(i-1) < 5
        S(i) = S(i-1)+sqrt((S(i-1)^2)-10*log(1-rand()))-S(i-1);
    else
        S(i) = S(i-1) + (48-10*S(i-1)+sqrt(((10*S(i-1)-48)^2)-40*log(1-rand())))/10;
    end
    i =i +1;
end

disp(S(2:11));

end