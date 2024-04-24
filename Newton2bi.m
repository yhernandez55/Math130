clear all
clc
close all

%f1
f = @(x) cos(x + sqrt(2)) + x.*(x/2 + sqrt(2));
fprime = @(x) x-sin(x + sqrt(2)) + sqrt(2);

%2. funct parameters
start = -2;
tol =1e-5;
max_iter =50;

%3 call newton
[output, err] = newtons(f, fprime, start,tol, max_iter);

% find convergence
x = err(1:end-1);
y = err(2:end);

logx =log(x);
logy =log(y);

figure(1)
plot(logx,logy, 'r-*')
slope = (logy(end)-logy(end-1))/(logx(end)-logx(end-1))
grid on
xlabel('outputs')
ylabel('error')
title('newtons method')
% -----------------
% define the fuction
function [root,err] = newtons(f, fp, x0, tol, N)
    iter = 1;
    while (iter < N)
        %1. use newtons to approx root
        xn = x0 - (f(x0)/fp(x0));

        % 2 compute err
        err(iter) = abs(xn - x0);

        % check if cont or break
        if (err(iter) < tol)
            root = xn;
            break
        else
            iter = iter + 1;
            x0 = xn;
        end
    end

end
