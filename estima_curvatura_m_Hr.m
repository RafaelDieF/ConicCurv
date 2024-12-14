function[c] = estima_curvatura_m_Hr(P1,t1,P2,t2,P3)

%ESTIMA_CURVATURA_m_HR calculates the curvature in P2 considering the triangle formed by P1, P2 and their tangents and the conic interpolating P1,P2 and P3

% INPUT: 
%		points P1,P2 and their tangents t1,t2
%		point P3 to find the parameter of the conic

% OUTPUT: curvature value assigned in P2

% find point of intersection of tangents
Q = interH(t1,t2); 

if Q(3) == 0 % parallel tangents
    c = 0; %'NO'
else
    q(1) = Q(1);
    q(2) = Q(2);
    p1 = P1(1:2);
    p2 = P2(1:2);
    p3 = P3(1:2);

    % find the barycentric coordinates of P3 with respect to P1, Q and P2
    v = [p1 - p2 ; q - p2]';
    x = v\[p3 - p2]'; 

    o = (x(2)^2)/(4*abs(x(1)*(1-x(1)-x(2)))); % to find omega^2

    p1 = [p1 1];
    p2 = [p2 1];
    q  = [q 1];
    A = [p1;p2;q];

    c = abs(det(A))/(2*(o)*(norm(q-p2))^3);
end

end