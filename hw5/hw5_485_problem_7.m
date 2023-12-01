function hw5_485_problem_7
[mn1,varc1,ci1] = cmc_simulation(1);
[im1, iv1, ici1] = importance_method1(1);
[imdelta2, ivdelta2, icdelta2] = importance_method2(1,2);
[imdelta3, ivdelta3, icdelta3] = importance_method2(1,3);

disp("When a = 1, estimate of z by CMC method is "+mn1)
disp("95% CI is "+ci1(1)+" to "+ci1(2))
disp("Estimate of z by importance sampling is "+im1)
disp("95% CI is "+ici1(1)+" to "+ici1(2))
disp("Estimate of z by importance sampling and delta 2 is "+imdelta2)
disp("95% CI is "+icdelta2(1)+" to "+icdelta2(2))
disp("Estimate of z by importance sampling and delta 3 is "+imdelta3)
disp("95% CI is "+icdelta3(1)+" to "+icdelta3(2))

[mn1,varc1,ci1] = cmc_simulation(3);
[im1, iv1, ici1] = importance_method1(3);
[imdelta2, ivdelta2, icdelta2] = importance_method2(3,2);
[imdelta3, ivdelta3, icdelta3] = importance_method2(3,3);

disp("When a = 3, estimate of z by CMC method is "+mn1)
disp("95% CI is "+ci1(1)+" to "+ci1(2))
disp("Estimate of z by importance sampling is "+im1)
disp("95% CI is "+ici1(1)+" to "+ici1(2))
disp("Estimate of z by importance sampling and delta 2 is "+imdelta2)
disp("95% CI is "+icdelta2(1)+" to "+icdelta2(2))
disp("Estimate of z by importance sampling and delta 3 is "+imdelta3)
disp("95% CI is "+icdelta3(1)+" to "+icdelta3(2))

[mn1,varc1,ci1] = cmc_simulation(10);
[im1, iv1, ici1] = importance_method1(10);
[imdelta2, ivdelta2, icdelta2] = importance_method2(10,2);
[imdelta3, ivdelta3, icdelta3] = importance_method2(10,3);

disp("When a = 10, estimate of z by CMC method is "+mn1)
disp("95% CI is "+ci1(1)+" to "+ci1(2))
disp("Estimate of z by importance sampling is "+im1)
disp("95% CI is "+ici1(1)+" to "+ici1(2))
disp("Estimate of z by importance sampling and delta 2 is "+imdelta2)
disp("95% CI is "+icdelta2(1)+" to "+icdelta2(2))
disp("Estimate of z by importance sampling and delta 3 is "+imdelta3)
disp("95% CI is "+icdelta3(1)+" to "+icdelta3(2))

end

function [cmean, cvar,CI] = cmc_simulation(a)
sigma = [4 -1; -1 4];
xmean = [0 0];
indlst = [];
for k = 1:10000
    x = mvnrnd(xmean, sigma);
    if x(1)>=a && x(2)>=a
        indlst(k) = 1;
    else
        indlst(k) = 0;
    end
end
cmean = mean(indlst);
cvar = var(indlst);
CI = zeros(1,2);
CI(1) = cmean- 1.96*(sqrt(cvar)/sqrt(10000));
CI(2) = cmean+ 1.96*(sqrt(cvar)/sqrt(10000));
end

function [imean, ivar, iCI] = importance_method1(a)
elist = [];
for k =1:10000
xstar = [a a];
sigma = [4 -1;-1 4];
x = mvnrnd(xstar,sigma);
es = x(1) >= a && x(2) >=a;

L = exp((-(xstar)*(inv(sigma))*transpose(x))+0.5*(xstar)*(inv(sigma))*transpose(xstar));
elist(k) = es*L;
end
imean = mean(elist);
ivar = var(elist);
iCI = zeros(1,2);
iCI(1) = imean- 1.96*(sqrt(ivar)/sqrt(10000));
iCI(2) = imean+ 1.96*(sqrt(ivar)/sqrt(10000));
end

function [imean2, ivar2, iCI2] = importance_method2(a, delta)
elist2 = [];
for k =1:10000
xstar = [a a];
sigmastar = [delta*4 -1*delta;-1*delta 4*delta];
sigma = [4 -1;-1 4];
x = mvnrnd(xstar,sigmastar);
es = x(1) >= a && x(2) >=a;

L = exp((-(xstar)*(inv(sigma))*transpose(x))+0.5*(xstar)*(inv(sigma))*transpose(xstar));
elist2(k) = es*L;
end
imean2 = mean(elist2);
ivar2 = var(elist2);
iCI2 = zeros(1,2);
iCI2(1) = imean2 - 1.96*(sqrt(ivar2)/sqrt(10000));
iCI2(2) = imean2 + 1.96*(sqrt(ivar2)/sqrt(10000));
end