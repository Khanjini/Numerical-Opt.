syms f(x,y)
f(x,y) = (x + 3*y -5).^2 + (3*x+ y -7).^2;

A = 2.*[10,6;6,10];
b = [52;44];
X = [30;30];

df_x = diff(f,x);
df_y = diff(f,y);

r = [double(df_x(X(1),X(2)));double(df_y(X(1),X(2)))];
p = -r;

m = 0

while m < 100 & f(X(1),X(2)) > 0.1;
    
    alpha = (r'*r)/(p'*(A*p));
    X2 = X + alpha*p;
    r2 = r + (alpha*A*p);
    beta = (r2'*r2)/(r'*r);
    
    p = -r2 +beta*p;
    r =r2;
    X = X2
    
    m = m+1;
    curr_eval = f(X(1),X(2));
    fprintf('%d times \ncurrent result is %d \n',m,curr_eval);
    
end

% m = 2, X = [2,1], r = 0
