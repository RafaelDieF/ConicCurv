function[i] = interH(c1,c2)
% interH:  finds the intersection of two straight lines or two points in projective coordinates

% INPUT: two points in projective coordinates (x1,x2,x3) or two straight lines in projective coordinates (a,b,c): ax + by + cz = 0

% OUTPUT: (x,y,z)
%             if the input is two points --> the output is a straight line
%             if the input is two straight lines --> the output is a point

i= zeros(1,3);
i(1) = c1(2)*c2(3) - c1(3)*c2(2); 
i(2) = c1(3)*c2(1) - c1(1)*c2(3); 
i(3) = c1(1)*c2(2) - c1(2)*c2(1); 

% normalize the projective coordinates
if i(3) ~= 0
    i(1) = i(1)/i(3);
    i(2) = i(2)/i(3);
    i(3) = 1;
end

end