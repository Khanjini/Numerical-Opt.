syms f(x,y)
f(x,y) = (x + 3*y -5).^2 + (3*x+ y -7).^2;

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

df_x = diff(f,x);
df_y = diff(f,y);
mag_dif = ((double(df_x(2,1))).^2).^(1/2) + ((double(df_y(2,1))).^2).^(1/2);

x = -30:30;
y = -30:30;
f = (x + 3*y -5).^2 + (3*x+ y -7).^2;

figure;surf(z)
xlabel('x-axis')
ylabel('y-axis')
set(gca,'XTickLabel',[-30:10:30],'YTickLabel',[-30:10:30])

%%
syms f(x,y)
f(x,y) = (x + 3*y -5).^2 + (3*x+ y -7).^2;

x1 = -20; y1 = 20; f1 = double(f(x1,y1));
x2 = -18; y2 = 21; f2 = double(f(x2,y2));
x3 = -21; y3 = 19; f3 = double(f(x3,y3));

X = [x1,x2,x3];
Y = [y1,y2,y3];
result = [f1,f2,f3];

best_index = find(result == min(result));
worst_index = find(result == max(result));
left_index = setdiff([1:3],[best_index,worst_index]);

sorted_result(1,1) = result(best_index);
sorted_result(1,2) = X(best_index);
sorted_result(1,3) = Y(best_index);
sorted_result(2,1) = result(left_index);
sorted_result(2,2) = X(left_index);
sorted_result(2,3) = Y(left_index);
sorted_result(3,1) = result(worst_index);
sorted_result(3,2) = X(worst_index);
sorted_result(3,3) = Y(worst_index);

m = 1;
% while sorted_result(1,1) >= 100;
while m < 1000 & sorted_result(1,1) > 0.1;
    k = 0;
    while k == 0;
        % Reflection
        c_x = ((sorted_result(1,2)+sorted_result(2,2))/2);
        c_y = ((sorted_result(1,3)+sorted_result(2,3))/2);
        c_f = double(f(c_x,c_y));
        
        new_x = (c_x + 1*(c_x - sorted_result(3,2)));
        new_y = (c_y + 1*(c_y - sorted_result(3,3)));
        new_f = double(f(new_x,new_y));
        
        current_best = sorted_result(1);
        %
        
        % Expanstion
        if new_f <= current_best
            n = 1;
            sorted_result(3) = sorted_result(2);
            sorted_result(2) = sorted_result(1);
            sorted_result(1) = new_f;
            
            sorted_result(3,2) = sorted_result(2,2);
            sorted_result(2,2) = sorted_result(1,2);
            sorted_result(1,2) = new_x;
            
            sorted_result(3,3) = sorted_result(2,3);
            sorted_result(2,3) = sorted_result(1,3);
            sorted_result(1,3) = new_y;
            
            while n ~= 0;
                
                new_x2 = floor(c_x + 5*(new_x-c_x));
                new_y2 = floor(c_y + 5*(new_y-c_y));
                new_f2 = double(f(new_x2,new_y2));
                
                if new_f2 <= new_f
                    
                    sorted_result(3) = sorted_result(2);
                    sorted_result(2) = new_f;
                    sorted_result(1) = new_f2;
                    
                    sorted_result(3,2) = sorted_result(2,2);
                    sorted_result(2,2) = new_x;
                    sorted_result(1,2) = new_x2;
                    
                    sorted_result(3,3) = sorted_result(2,3);
                    sorted_result(2,3) = new_y;
                    sorted_result(1,3) = new_y2;
                    
                    current_best = new_f;
                    new_f = new_f2;
                    
                    c_x = new_x;
                    c_y = new_y;
                    
                    new_x = new_x2;
                    new_y = new_y2;
                    
                    n = n +1;
                else
                    k = 1;
                    break
                end;
                
            end;
            k = 1;
        end
        %
        
        if sorted_result(1) <= new_f & new_f <= sorted_result(2)
            
            sorted_result(3,1) = sorted_result(2,1);
            sorted_result(2,1) = new_f;
            
            sorted_result(3,2) = sorted_result(2,2);
            sorted_result(2,2) = new_x;
            
            sorted_result(3,3) = sorted_result(2,3);
            sorted_result(2,3) = new_y;
            
            k = 1;
        end;
        
        
        %contraction
        if new_f >= sorted_result(2)
            if new_f < sorted_result(3)
                new_x2 = (c_x + 0.5*(new_x-c_x));
                new_y2 = (c_y + 0.5*(new_y-c_y));
                new_f2 = double(f(new_x2,new_y2));
            end;
            
            if new_f >= sorted_result(3)
                new_x2 = (c_x + 0.5*(sorted_result(3,2)-c_x));
                new_y2 = (c_y + 0.5*(sorted_result(3,3)-c_y));
                new_f2 = double(f(new_x2,new_y2));
            end;
            
            if new_f2 < min(sorted_result(3),new_f)
                
                sorted_result(3,1) = new_f2;
                sorted_result(3,2) = new_x2;
                sorted_result(3,3) = new_y2;
            else
                k = 1;
                break
            end;
            k = 1;
        end;
    end;
    
    
    if abs(sorted_result(1,1) - sorted_result(2,1)) < 0.001;
        sorted_result(3,2) = sorted_result(3,2) + 1;
        sorted_result(3,3) = sorted_result(3,3) - 1;
        sorted_result(3,1) = f(sorted_result(3,2),sorted_result(3,3));
    end;
    
    if abs(sorted_result(1,1) - sorted_result(2,1)) < 0.001;
        sorted_result(2,2) = sorted_result(2,2) + 1;
        sorted_result(2,3) = sorted_result(2,3) - 1;
        sorted_result(2,1) = f(sorted_result(2,2),sorted_result(2,3));
    end;
    
    % sorting
    best_index = find(sorted_result(:,1) == min(sorted_result(:,1)));
    best_index = best_index(1);
    worst_index = find(sorted_result(:,1) == max(sorted_result(:,1)));
    worst_index = worst_index(1);
    left_index = setdiff([1:3],[best_index,worst_index]);
    
    new_result(1,1) = sorted_result(best_index,1);
    new_result(1,2) = sorted_result(best_index,2);
    new_result(1,3) = sorted_result(best_index,3);
    new_result(2,1) = sorted_result(left_index,1);
    new_result(2,2) = sorted_result(left_index,2);
    new_result(2,3) = sorted_result(left_index,3);
    new_result(3,1) = sorted_result(worst_index,1);
    new_result(3,2) = sorted_result(worst_index,2);
    new_result(3,3) = sorted_result(worst_index,3);
    
    sorted_result = new_result;
    record{m} = sorted_result;
    current_result = sorted_result(1,1);
    fprintf('%d times \ncurrent result is %d \n',m,current_result);
    m = m+1;
end;

% m = 32, best solution = [0.0878,1.9025,1.0065]

%%
xx1(1) = record{1, 1}(1,2);xx1(2) = record{1, 1}(1,3);xx1(3) = record{1, 1}(1,1);
xx2(1) = record{1, 2}(1,2);xx2(2) = record{1, 2}(1,3);xx2(3) = record{1, 1}(1,1);
xx3(1) = record{1, 2}(1,2);xx3(2) = record{1, 2}(1,3);xx3(3) = record{1, 1}(1,1);
hold on;
figure; fill3(xx1',xx2',xx3','r')
