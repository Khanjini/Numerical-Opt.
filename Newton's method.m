%% Newton's

syms f(x)
f(x) = x.^2 - 150*x;
Df = diff(f,x);

a = 100;

n = 0;

while f(a) ~= 0 
    
    a = floor(a - f(a)/Df(a));
    
    f(a)
    
    n = n +1;
    
end;

% answer = 150, n = 3
