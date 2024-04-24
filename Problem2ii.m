clear all
clc
close all

%1.Define the funtion
f =@(x) x.^3;

% plot
x = -5:0.1:5;
xaxis = zeros(length(x),1);

figure(1)
plot(x,f(x),"b-s",x,xaxis,"k-")
grid on
xlabel('x')
ylabel('y')
hold on

%2. interval [a,b]
a = -3;
b = 1;
fa = f(a);
fb = f(b);

%3. specefic tolereance
tol = 1e-5;

% bisection method
iter = 1;
iter_max = 50;

while(iter < iter_max)
    mid = (a+b)/2;
    error(iter) = abs(f(mid)-0);
    if (error(iter) < tol)
        root = mid;
        break
    else
        if (f(a) * f(mid) < 0)
            b = mid;
        else
            a = mid;
        end
    iter = iter+1;
    end

   
end

plot(root,f(root),'ro','MarkerSize',10,'LineWidth',2)

format long;
funct_root = root
hold off

arr_iter = 1:iter;
figure(2)
plot(arr_iter,error,'m-*')
grid on
xlabel('# of iterations')
ylabel('absolute error')
title('Convergence of Bisectional Method')

