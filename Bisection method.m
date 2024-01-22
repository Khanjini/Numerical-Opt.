%% Bisection
syms f(x)
f(x) = 4*x.^2 + 12*x - 1080;

a = 14;
b = 70;
f(a)*f(b)

k = floor((a+b)/2);

n = 0;

while f(k) ~= 0;
    
    k = floor((a+b)/2);
    
    f(k)
    
    if f(a)*f(k) < 0;
        b = k;
    else 
        a = k;
    end;
    
    n = n +1;
    
end;

% answer = 15, n = 5
