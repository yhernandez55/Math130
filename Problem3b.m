 clear all
 clc
 close all
 
% modified newton method
f = @(x) exp(6*x) + 1.441*exp(2*x) - 2.079*exp(4*x) - 0.333;
fprime = @(x) 2.882*exp(2*x) -8.316*exp(4*x) +6*exp(6*x);
fdp = @(x) 36*exp(6*x) -33.264*exp(4*x) +5.764*exp(2*x);
%2. funct parameters
start = -1.5;
tol =1e-5;
max_iter =50;

%3 call newton
[output, err_estimate] = newtons(f, fprime,fdp, start,tol, max_iter);

% find convergence
x = err_estimate(1:end-1);
y = err_estimate(2:end);

logx =log(x);
logy =log(y);

figure(1)
plot(logx,logy, 'r-*')
slope = (logy(end)-logy(end-1))/(logx(end)-logx(end-1))
grid on
xlabel('outputs')
ylabel('error')
title('modified newtons method')
% -----------------
% define the fuction
function [root,err] = newtons(f, fp,fdp, xn, tol, N)
    iter = 1;
    while (iter < N)
        %1. use newtons to approx root
        x_next= xn -(f(xn)*fp(xn))/(fp(xn).^2 -f(xn)*fdp(xn));

        % 2 compute err
        err(iter) = abs(x_next - xn);

        % check if cont or break
        if (err(iter) < tol)
            root = x_next;
            break
        else
            iter = iter + 1;
            xn = x_next;
        end
    end

end


    