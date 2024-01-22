%% Regular falsi
syms f(x)
f(x) = x.^3 - x.^2 + 2*x;

x_1 = -500;
x_2 = 100;

n = 0;

while f(x_2) ~= 0 
    
    n = n +1;
    
    Df = (x_1-x_2)/(f(x_1)-f(x_2));
    
    x_3 = floor(x_1 - Df*f(x_1));
    
    if f(x_1)*f(x_3) <0
        x_2 = x_3;
    elseif f(x_1)*f(x_3) >0
        x_1 = x_3;
    else f(x_3) == 0
        x_2 = x_3;
    end;
    
    f(x_3)
    
end;

% answer = 0, n = 74
