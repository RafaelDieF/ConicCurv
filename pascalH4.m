function[v] = pascalH4(P1, P2, P3, P4, P5)

%the tangent at P4 is computed as: P4 ^ (L12 ^ (A ^ B))
%first intersection point:  A = L15 ^ L34
%second intersection point: B = L23 ^ L45
%third intersection point: L44 ^ L12, but finding: C = AB ^ L12

% INPUT: 5 points in projective coordinates (x,y,1)

% OUTPUT: the projective coordinates (a,b,c) of the tangent line: 
%         ax + by + cz = 0

% is equivalent to applying pascalH3 to a reordering of points

v = pascalH3(P2,P3,P4,P5,P1);

end
