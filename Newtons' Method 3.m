%% Newtons' Method
a = 3;
b = -12;
c = 25;

s = 500;
x0 = s;
x1 = s;

y1 = second_func(s,a,b,c);
new_y = second_func(s-1,a,b,c);

n = 1;
diff1 = 2*a*x0 + b;

while s ~= 0;
    
    diff1 = 2*a*x1 + b;
    diff2 = 2*a;
    
    new_x = x1 - diff1/diff2;
    new_y = second_func(new_x,a,b,c);
    
    if y1 <= new_y ;
        s = x0;
        e = new_x;
        break
    end;
    
    if y1 > new_y;
        x0 = x1;
        x1 = new_x;
        y1 = new_y;
    end;  
    
    n = n +1;
    
end;

s = x0;
e = x1;

% n = 2
