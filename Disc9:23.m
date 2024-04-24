clear all
clc
close all

% ex1: f=x^3 +4x^2 -10, find root using newtons method
f = @(x) x.^3 + 4*x.^2 -10;
fprime = @(x) 3*x.^2 + 8*x;

%2. funct parameters
start = -1.5;
tol =1e-5;
max_iter =50;

%3 call newton
[output, err_est] = newtons(f, fp, start, max_iter)

% find convergence
x = err_est(1:end-1);
y = err_est(2:end);

logx =log(x);
logy =log(y);

figure(1)
plot(logx,logy, 'ro')
grid on

% order of convergence = slope of the line = rise/rubn=
% y2-y1/x2-x1 pick 2 pts from lofx logy

% -----------------
% define the fuction
function [root,err] = newetons(~, ~, ~, ~, N)
    iter = 1;
    while (iter < N)
        %1. use newtons to approx root
        xn = x0 - (f(x0)/fp(x0));

        % 2 compute err
        err(iter) = abs(xn - x0);

        % check if cont or break
        if (err(ilter) < tol)
            root = xn;
            break
        else
            iter = iter + 1;
            x0 = xn;
        end
    end

end



