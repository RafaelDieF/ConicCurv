function[v] = pascalH2(P1, P2, P3, P4, P5)

%the tangent at P2 is computed as: P2 ^ (L45 ^ (A ^ B))
%first intersection point: A = L12 ^ L34
%second intersection point: B = L23 ^ L15
%third intersection point: L22 ^ L45, but finding: C = AB ^ L45

% INPUT: 5 points in projective coordinates (x,y,1)

% OUTPUT: the projective coordinates (a,b,c) of the tangent line
%         ax + by + cz = 0

% is equivalent to applying pascalH3 to a reordering of points

v = pascalH3(P5,P1,P2,P3,P4);

end