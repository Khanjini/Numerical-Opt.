M1 = readmatrix('Model1_Data.txt');
M2 = readmatrix('Model2_Data.txt');

%% Data 1 - Gauss & Newton's

syms r(a,b,c,d)
r(a,b,c,d) = a*M1(:,1) + b*M1(:,2) + c*M1(:,3) + d - M1(:,4);

syms f(a,b,c,d)
f(a,b,c,d) = 0.5*sum(r(a,b,c,d).^2);

syms a b c d
jaco(a,b,c,d) = jacobian(r(a,b,c,d),[a,b,c,d] );

x1 = [1;1;1;1];
tol = 1e-5;
m = 0;
while m < 100
    
   j = double(jaco(x1(1),x1(2),x1(3),x1(4))); 
    
   err = double(r(x1(1),x1(2),x1(3),x1(4)));
   
   p = double(-(j'*j)\(j'*err));
   
    x2 = x1 + p;
    
    eval1 = double(f(x1(1),x1(2),x1(3),x1(4)))
    eval2 = double(f(x2(1),x2(2),x2(3),x2(4)))
    
    if eval1 > eval2;
        x1 = x2;
        m = m+1
    end;
    
    if norm(p) < tol
        fprintf('Converged in %d iterations\n', m);
        break;
    end
end;
