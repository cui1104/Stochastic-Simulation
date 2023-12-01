function hw3_485_last_problem_xt
x=[];

for t = 1:1:100
   f=@(s) (sin(0.5.*s).*3.*exp(-t+s))+(3.*exp(-t+s))+(sin(0.5.*s).*2.*exp(-0.5.*(t-s)))+(2.*exp(-0.5.*(t-s)));
   x(t)=integral(f,0,t);
end

disp(x);

disp("mean is: ")
disp(mean(x))
disp("var is: ")
disp(var(x))

plot(1:100,x);
title("x(t) over t from 1 to 100")

end