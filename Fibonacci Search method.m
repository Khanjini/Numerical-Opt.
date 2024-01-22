%% Fibonacci Search function

Fibo_nums = [];
Fibo_nums(1) = 1;
Fibo_nums(2) = 1;

x = 20;

for i = 3:x;
    Fibo_nums(i) = Fibo_nums(i-2) + Fibo_nums(i-1);
end;

%% Newtons' method + Fibonacci Search


eval_num = [];
eval_val = [];

eval_num(1) = s;
eval_num(21) = e;

s_v = second_func(s,a,b,c);;
e_v = new_y;

eval_val(1) = s_v;
eval_val(21) = e_v;

fs = size(Fibo_nums,2);
n = 0;
s_n = 0;
e_n = 0;

for i = 1:fs-2;
    
    f1 = floor(s*Fibo_nums(fs-1-n)/Fibo_nums(fs-n) + e*Fibo_nums(fs-n-2)/Fibo_nums(fs-n));
    f2 = floor(s*Fibo_nums(fs-n-2)/Fibo_nums(fs-n) + e*Fibo_nums(fs-n-1)/Fibo_nums(fs-n));
    
    if isempty(find(eval_num == f1));
        eval_num(s_n+2) = f1;
        y1 = second_func(f1,a,b,c);
        eval_val(s_n+2) = y1;
        s_n = s_n +1;
    end;
    
    if isempty(find(eval_num == f2));
        eval_num(fs-e_n) = f2;
        y2 = second_func(f2,a,b,c);
        eval_val(fs-e_n) = y2;
        e_n = e_n + 1;
    end;
    
    if y1 > y2;
        s = f1;
    else
        e = f2;
    end;
    
    n = n + 1;
    
end;

ans = min(eval_val);

% n = 18;
