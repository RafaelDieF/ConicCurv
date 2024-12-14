function[c] = estima_curvatura_i_Hl(P1,t1,P2,P3,t3)

%ESTIMA_CURVATURA_i_HL calculates the curvature in P1 considering the triangle formed by P1, P3 and its tangents and the conic interpolating P1,P2 and P3

% INPUT: 
%		points P1,P3 and their tangents t1,t3
%		point P2 to find the parameter of the conic

% OUTPUT: curvature value assigned in P1

% find point of intersection of tangents
Q = interH(t1,t3); 

if Q(3) == 0 % parallel tangents
    c = 'NO';
else
    q(1) = Q(1);
    q(2) = Q(2);
    p1 = P1(1:2);
    p2 = P2(1:2);
    p3 = P3(1:2);

    % find the barycentric coordinates of P2 with respect to P1, Q and P3
    v = [p1 - p3 ; q - p3]';
    x = v\[p2 - p3]'; 

    o = (x(2)^2)/(4*(x(1)*(1-x(1)-x(2)))); % to find omega omega^2

    p1 = [p1 1];
    p3 = [p3 1];
    q  = [q 1];
    A = [p1;p3;q];

    c = abs(det(A))/(2*(o)*(norm(q-p1))^3);
end

end