%% Lagrange polynomial interpolation

a = 1;
b = -90;
c = -810;
d = 300;

s = -10;
e = 150;
m = (s+e)/2;

s_v = third_func(s,a,b,c,d);
e_v = third_func(e,a,b,c,d);
m_v = third_func(m,a,b,c,d);

n = 1;
while s ~= -21;
    
    new_x = floor((s_v*(e*e - m*m) + e_v*(m*m - s*s) + m_v*(s*s - e*e))/(2*(s_v*(e - m) + e_v*(m - s) + m_v*(s - e))));
    
    new_v = third_func(new_x,a,b,c,d);
    
    if new_v == e_v | new_v == s_v
        break
    end;
    
    if new_x < m;
        if s_v > new_v > m_v;
            s = new_x;
            s_v = new_v;
            m = floor((s+e)/2);
        elseif s_v < new_v < m_v;
            e = m;
            e_v = m_v;
            m = floor((s+e)/2);
        end;
    else
        if m_v < new_v < e_v;
            e = new_x;
            e_v = new_v;
            m = floor((s+e)/2);
        elseif m_v > new_v > e_v;
            e = m;
            e_v = m_v;
            m = floor((s+e)/2);
        end;
    end;
    
    m_v = third_func(m,a,b,c,d);
    
    n = n+1;
end;

% n = 6
