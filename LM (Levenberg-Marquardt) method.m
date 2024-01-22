M1 = readmatrix('Model1_Data.txt');
M2 = readmatrix('Model2_Data.txt');

%% Data 1 - LM

x1 = [1;1;1;1];
lamm = 10;
ident = eye(4,4);
m = 0;
tol = 1e-5;

while m < 100
    
   j = double(jaco(x1(1),x1(2),x1(3),x1(4))); 
    
   err = double(r(x1(1),x1(2),x1(3),x1(4)));
   
   p = double(-(j'*j + lamm*ident)\(j'*err));
   
    x2 = x1 + p;
    
    eval1 = double(f(x1(1),x1(2),x1(3),x1(4)))
    eval2 = double(f(x2(1),x2(2),x2(3),x2(4)))
    
    while eval1 > eval2;
        lamm = lamm/10;
        p = double(-(j'*j + lamm*ident)\(j'*err));
        x3 = x1 + p;
        eval3 = double(f(x3(1),x3(2),x3(3),x3(4)))
        if eval2 > eval3
            x2 = x3;
            eval2 = eval3
        else
            lamm = 10;
            break
        end;
    end;
    
    while eval1 < eval2;
        
        lamm = lamm*10;
        p = double(-(j'*j + lamm*ident)\(j'*err));
        x3 = x1 + p;
        eval3 = double(f(x3(1),x3(2),x3(3),x3(4)))
        if eval2 > eval3
            x2 = x3;
            eval2 = eval3
        else
            lamm = 10;
            break
        end;
    end;
    
    if eval1 > eval2;
        x1 = x2;
    end;
    
    if norm(p) < tol
        fprintf('Converged in %d iterations\n', m);
        break;
    end
    
    m = m +1;
    
end;
