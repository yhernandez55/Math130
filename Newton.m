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
[output, err_estimate] = newtons(f, fprime, start,tol, max_iter);

% find convergence
x = err_estimate(1:end-1);
y = err_estimate(2:end);

logx =log(x);
logy =log(y);

figure(1)
plot(logx,logy, 'r-*')
slope = (logy(end)-logy(end-1))/(logx(end)-logx(end-1))

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

% %%
% 
% xtrue = exp(1);
% x =1;
% 
% fprintf('k\t x_n \t\ Releer\n');
% 
% n = 0;
% xn = 1;
% Releer = abs(xtrue-xn)/xtrue;
% fprintf('%d \t %0.11f \t %0.5e\n',n,xn,Releer);
% 
% tic
% 
% error_bound = .5e-5;
% 
% while Releer>error_bound
%     n = n+1;
%     xn = xn+x.^n /factorial(n);
%     Relerr = abs(xtrue-xn)/xtrue;
% end
% 
% fprintf('%d \t %0.11f \t %0.5e\n',n,xn,Relerr);
% 
% toc
% 
% 
