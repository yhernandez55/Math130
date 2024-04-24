clear all
clc
close all

%Bisection method
%Goal: find the root x = 2 for the function in the example
%f(x) = x^2 - 4

%1. Define the function
f =@(x) x.^2 - 4;

%here is a plot of the function 
x = -4:0.1:4;
xaxis = zeros(length(x),1);

figure(1)
plot(x, f(x), 'b-s', x, xaxis, 'k-')
grid on
xlabel('x')
ylabel('y')
hold on

%2. Specify the interval [a, b]
%NOTE: pick the interval yourself!
%MODIFY this part 

a = 0.5;
b = 4; 

%3. Specify tolerance for accuracy
%NOTE: pick theh tolerance yourself! 
%MODIFY this part
tol = 1e-5;

%write the bisection method here :) 
max_iter = 100;
iter = 1;
root = 999999999;

while (iter <max_iter)
    
    %1 compute mid point
    mid = (a+b)/2;
    
    %2 compute error
    %Absolute error= |approx-exact|
    % exact here is 0
    err(iter) = abs(f(mid));
    
    % do we continue or break?
    if (err(iter) < tol)
        root = mid;
        fprintf("Found root %f at iteration %d with an absolute error of %f",root,iter,err)
        break;
    else 
        % split up the interval
        if (f(mid)*f(a) < 0)
            b = mid;
        else
            a = mid;
        end
    end
    
    % incorrect counter
    iter = iter + 1;
    
end % end bisection method

% add the root to the og plot
plot(root,f(root),'ro','MarkerSize',10,'LineWidth',2)
hold off

% plot convergence 
arr_iter = 1:iter;
figure(2)
loglog(arr_iter,err,'s')
grid on
xlabel('# of iterations')
ylabel('absolute error')
title('coonvergence of Bisection Method')
    

            
    


    


    



