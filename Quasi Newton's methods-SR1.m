syms f(x,y)
f(x,y) = (x + 3*y -5).^2 + (3*x + y - 7).^2;

c= 1;
r =1;
z = zeros(30,30);
for i = -30:30;
    
    for j = -30:30;
        z(c,r) = double(f(i,j));
        r = r +1;
    end;
    r= 1;
    c = c +1;
end;

figure;surf(z)
xlabel('x-axis')
ylabel('y-axis')
set(gca,'XTickLabel',[-30:10:30],'YTickLabel',[-30:10:30])

df_x = diff(f,x);
df_y = diff(f,y);

a = 30, b = 30; 
curr_point = [a,b];
curr_eval = double(f(curr_point(1),curr_point(2)));

df_f = [double(df_x(a,b)),double(df_y(a,b))];
mag_dif = ((double(df_x(a,b))).^2).^(1/2) + ((double(df_y(a,b))).^2).^(1/2);

p = -df_f./mag_dif;
new_point = curr_point + p;

%% Quasi Newton's methods: SR1
 
h = hessian(f,[x,y]);
bb = eye(2,2);
m = 0;

while m < 100 & curr_eval > 0.1;
    
    x1 = new_point(1);
    y1 = new_point(2);
    new_df_f = [double(df_x(x1,y1)),double(df_y(x1,y1))];

    y = new_df_f - df_f;

    s = new_point - curr_point;
    
    new_b = bb + (y'-bb*s')*(y'-bb*s')'./(y'-bb*s')'*s';
    
    inver_new_b = inv(new_b);
    
    new2_point = (new_point' - inver_new_b*new_df_f')';
    
    new_eval = double(f(new2_point(1),new2_point(2)));
    curr_eval = double(f(new_point(1),new_point(2)));
    
    if new_eval <= curr_eval;
        curr_point = new_point;
        new_point = new2_point;
        
        new_df_f = [double(df_x(new_point(1),new_point(2))),double(df_y(new_point(1),new_point(2)))];
        df_f= [double(df_x(curr_point(1),curr_point(2))),double(df_y(curr_point(1),curr_point(2)))];
        
        bb = new_b;
    end;
    
    m = m + 1;
    fprintf('%d times \ncurrent result is %d \n',m,curr_eval);
    
end;

% m = 100, best soulution = [4.6250,-1.6250] --> 55.1250
