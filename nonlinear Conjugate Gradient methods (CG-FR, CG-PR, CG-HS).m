syms f(x,y)
f(x,y) = 50*(x - y).^2 + (1 - y).^2;

df_x = diff(f,x);
df_y = diff(f,y);

X = [10;10];
df_f = [double(df_x(X(1),X(2)));double(df_y(X(1),X(2)))];

p = -df_f

alpha = 0.01;
m = 0;

while m < 4000 ;
    
    if mod(m,100) == 0;
        alpha = 0.01;
    end;
    
    if mod(m,10) == 0
        alpha = alpha*0.1;
    end;
    
    X2 = X + alpha*p;
    
    df_2 = [double(df_x(X2(1),X2(2)));double(df_y(X2(1),X2(2)))];
    
    beta = (df_2'*df_2)/(df_f'*df_f);
    
    v = abs(df_2'*df_f)/(df_f'*df_f)
    
    if v > 1;
        beta = 0;
    end;
    
    p = - df_f + beta*p;
    X = X2
    df_f = df_2
    m = m + 1;
    
end;

% m = 1000*4 , X = [1,1], grad = [0,0]

alpha = 0.01;
m = 0;

while m < 4000 ;
    
    if mod(m,100) == 0;
        alpha = 0.01;
    end;
    
    if mod(m,10) == 0
        alpha = alpha*0.1;
    end;
    
    X2 = X + alpha*p;
    
    df_2 = [double(df_x(X2(1),X2(2)));double(df_y(X2(1),X2(2)))];
    
    beta = (df_2'*(df_2-df_f))/(df_f'*df_f);
    
    v = abs(df_2'*df_f)/(df_f'*df_f)
    
    if v > 1;
        beta = 0;
    end;
    
    p = - df_f + beta*p;
    X = X2
    df_f = df_2
    m = m + 1;
end;

% m = 1000*4 , X = [6.8126,6.7548], grad = [5.7836,5.7260]


alpha = 0.01;
m = 0;

while m < 4000 ;
    
    if mod(m,100) == 0;
        alpha = 0.01;
    end;
    
    if mod(m,10) == 0
        alpha = alpha*0.1;
    end;
    
    X2 = X + alpha*p;
    
    df_2 = [double(df_x(X2(1),X2(2)));double(df_y(X2(1),X2(2)))];
    
    beta = (df_2'*(df_2-df_f))/((df_2 - df_f)'*p);
    
    v = abs(df_2'*df_f)/(df_f'*df_f)
    
    if v > 1;
        beta = 0;
    end;
    
    p = - df_f + beta*p;
    X = X2
    df_f = df_2
    m = m + 1;
end;

% m = 1000*3 , X = [8.2746,8.2022], grad = [7.2438,7.5607]
