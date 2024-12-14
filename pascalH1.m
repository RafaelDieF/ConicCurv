function[v] = pascalH1(P1, P2, P3, P4, P5)

%the tangent at P1 is computed as: P1 ^ (L34 ^ (A ^ B))
%first intersection point: A = L12 ^ L45
%second intersection point: B = L23 ^ L15
%third intersection point: L11 ^ L34, but finding: C = AB ^ L34

% INPUT: 5 points in projective coordinates (x,y,1)

% OUTPUT: the projective coordinates (a,b,c) of the tangent line: 
%         ax + by + cz = 0

% is equivalent to applying pascalH3 to a reordering of points

v = pascalH3(P4,P5,P1,P2,P3);

end

