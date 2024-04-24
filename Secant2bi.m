clear all
clc
close all

% secant 
f = @(x) cos(x+ sqrt(2))+x*(x/2 + sqrt(2));

%2. funct parameters
start0 = -2;
start1 = -1;
tol =1e-5;
max_iter =49;

[root,err] = secant(f,start0,start1,tol,max_iter);
% find convergence
x = err(1:end-1);
y = err(2:end);

logx =log(x);
logy =log(y);

figure(1)
plot(logx,logy, 'r-*')
slope = (logy(end)-logy(end-1))/(logx(end)-logx(end-1))
grid on
xlabel('root')
ylabel('error')
title('secant method')

function [root,err] = secant(f,x0,x1,tol,N)
iter = 1;
    while (iter < N)
    p = x1 - (((x1-x0)*f(x1))/(f(x1)-f(x0)));
    
    err(iter) = abs(p-x1);
    if err(iter) < tol
        root = p;
        break;
    else
        iter = iter +1;
        x0 = x1;
        x1 = p;
    end
    end
end


