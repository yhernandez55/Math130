clear;
clc;

%# You function here
g=@(x) (-5*x.^3 + x.^2 -1).^1/5;

%# Start out iteration loop
x1 = 0;
x2 = g(x1);

iterations = 0;% # iteration counter

ezplot(g,[0,1]);
hold on 
ezplot('x',[[0,1]])

while (abs(x2-x1) > 1e-6 && iterations<100)
    plot([x1 x1], [x1 x2], 'k-')
    plot([x1 x2], [x2 x2], 'k--')
     %pause
    iterations = iterations + 1;
    x1 = x2;
    x2 = g(x1);
end
iterations 
[x1 x2]
% Labels
xlabel('x')
ylabel('y')
title('Convergence of Fixed Point')

%%
clear;
clc;

%# You function here
g=@(x) ((-x.^5 + x.^2 -1).^1/3)/5;

%# Start out iteration loop
x1 = 0;
x2 = g(x1);

iterations = 0;% # iteration counter

ezplot(g,[0,1]);
hold on 
ezplot('x',[[0,1]])

while (abs(x2-x1) > 1e-6 && iterations<100)
    plot([x1 x1], [x1 x2], 'k-')
    plot([x1 x2], [x2 x2], 'k--')
     %pause
    iterations = iterations + 1;
    x1 = x2;
    x2 = g(x1);
end
iterations 
[x1 x2]
% Labels
xlabel('x')
ylabel('y')
title('Convergence of Fixed Point')

%%
clear;
clc;

%# You function here
g=@(x) (x.^5 + 5*x.^3 + 1).^1/2;

%# Start out iteration loop
x = 0;
y = g(x);

iterations = 0;% # iteration counter

ezplot(g,[0,1]);
hold on 
ezplot('x',[[0,1]])

while (abs(y-x) > 1e-6 && iterations<100)
    plot([x x], [x y], 'k-')
    plot([x y], [y y], 'k--')
     %pause
    iterations = iterations + 1;
    x = y;
    y = g(x);
end
iterations 
[x y]
% Labels
xlabel('x')
ylabel('y')
title('Convergence of Fixed Point')
