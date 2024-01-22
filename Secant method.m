%% Secant
syms f(x)
f(x) = x.^2 - 150*x;

x_1 = 100;
x_2 = 98;

n = 0;

while f(x_2) ~= 0 
    
    Df = (x_1-x_2)/(f(x_1)-f(x_2));
    
    x_2 = floor(x_1 - Df*f(x_1));
    
    f(x_2)
    
    n = n +1;
    
end;

% answer = 150, n = 7
