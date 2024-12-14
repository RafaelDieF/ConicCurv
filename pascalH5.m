function[v] = pascalH5(P1, P2, P3, P4, P5)

%the tangent at P5 is computed as: P5 ^ (L23 ^ (A ^ B))
%first intersection point:  A = L12 ^ L45
%second intersection point: B = L34 ^ L15
%third intersection point: L55 ^ L23, but finding: C = AB ^ L23

% INPUT: 5 points in projective coordinates (x,y,1)

% OUTPUT: the projective coordinates (a,b,c) of the tangent line: 
%         ax + by + cz = 0

% is equivalent to applying pascalH3 to a reordering of points

v = pascalH3(P3,P4,P5,P1,P2);

end
