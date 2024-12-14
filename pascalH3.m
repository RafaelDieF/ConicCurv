function[v] = pascalH3(P1, P2, P3, P4, P5)

%the tangent at P3 is computed as: P3 ^ (L15 ^ (A ^ B))
%first intersection point: A = L12 ^ L34
%second intersection point: B = L23 ^ L45
%third intersection point: L33 ^ L15, but finding: C = AB ^ L15

% INPUT: 5 points in projective coordinates (x,y,1)

% OUTPUT: the projective coordinates (a,b,c) of the tangent line: 
%         ax + by + cz = 0

L12 = interH(P1,P2);
L23 = interH(P2,P3);
L34 = interH(P3,P4);
L45 = interH(P4,P5);
L15 = interH(P1,P5);

A = interH(L12,L34);
B = interH(L23,L45);
C = interH(interH(A,B),L15);

v = interH(P3,C);

end
 
