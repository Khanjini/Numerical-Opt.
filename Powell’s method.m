syms f(x,y)
f(x,y) = (1.5 - x + x*y).^2 + (2.25 - x + x*y*y).^2  + (2.625 - x + x*y*y*y).^2;

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

%%
m= 1;
x = 30; y = 30; r=-1;

p = [x,y];

e_1 = [1,0]
e_2 = [0,1]

current_best = double(f(p(1,1),p(1,2)))

while current_best(1) > 1
    p_1 = p + r*e_1;
    e_x = double(f(p_1(1,1),p_1(1,2)));
    situation(1,:) = [e_x,p_1];
    
    p_2 = p + r*e_2;
    e_y = double(f(p_2(1,1),p_2(1,2)));
    situation(2,:) = [e_y,p_2];
    
    e_new = p - p_2;
    p_new = p + r*e_new;
    e_z = double(f(p_new(1,1),p_new(1,2)));
    situation(3,:) = [e_z,p_new];
    
    result = [e_x,e_y,e_z];
    ind = find(min(situation(:,1)) == situation(:,1));
    ind = ind(1);
    
    current_best = situation(ind,:);
    p = current_best([2,3]);
    fprintf('%d times \ncurrent result is %d \n',m,current_best(1));
    m = m+1;
    
end;

% m = 58, best soulution = [0.7031,2,0]
