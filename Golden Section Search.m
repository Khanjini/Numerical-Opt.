%% Golden Section Search

t = 0.6180;

s_v = second_func(s,a,b,c);
e_v = second_func(e,a,b,c);

eval_num = [];
eval_val = [];

eval_num(1) = s;
eval_num(2) = e;

eval_val(1) = s_v;
eval_val(2) = e_v;

n = 1;
nn = 3;

while e ~= s+1;
    
    l = s-e;
    t2 = floor(t*l + e);
    t1 = floor((1-t)*l + e); 
    
    if ~ismember(eval_num,[t1+1,t1,t1-1]);
        eval_num(nn) = t1;
        y1 = second_func(t1,a,b,c);
        eval_val(nn) = y1;
        nn = nn +1;
    end;
    
   if ~ismember(eval_num,[t2+1,t2,t2-1]);
        eval_num(nn) = t2;
        y2 = second_func(t2,a,b,c);
        eval_val(nn) = y2;
        nn = nn + 1;
    end;
    
    if y1 > y2;
        e = t1;
    else
        s = t2;
    end;
    
    n = n + 1;
    
    if n > 3;
        if size(eval_num,2) ~= n+2
            ans = min(eval_val);
            break
        end;
    end;
    
end;

% n = 11;
