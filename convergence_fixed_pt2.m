clear;
clc;

%# You function here
g=@(x) 1/32*(x.^4 -8*x.^3 +24*x.^2 +16);

%# Start out iteration loop
x1 = 0;
x2 = g(x1);

iterations = 0; % # iteration counter

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
g=@(x) -1/24*(x.^4 -8*x.^3 -32*x +16).^1/2;

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
g=@(x) 1/8*(x.^4 +24*x.^2 -32*x +16).^1/3;

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
