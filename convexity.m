function [ SP ] = convexity( P, var )
%CONVEXITY Divide a poligonal in convex subpoligonals

% INPUT:  P -> poligonal
%         var -> variante 1 : Gudrun & Lucia, variante 2: Diaz & Estrada

% OUTPUT: SP -> new structure that indicates amount of points and which ones belong to each subpoligonals

if nargin<2
    var = 1;
end

N = length(P);
np = 1;

SP(np) = struct('cant', 3, 'pol', []); % new structure for subpoligonals

if var == 1 % separate each subpoligonal with a midpoint inserted on each inflexion edge
    while (np < N) && (~isempty(P(2:end,:)))
        n = length(P); % polygonal remainder
        s = sign(dot(P(1,:) - P(2,:),[0 -1;1 0]*(P(3,:) - P(2,:))'));
        SP(np).pol = cat(1,SP(np).pol,P(1,:),P(2,:),P(3,:));
        i = 3;
        while (i < n) && (sign(dot(P(i-1,:) - P(i,:),[0 -1;1 0]*(P(i+1,:) - P(i,:))'))==s)
            SP(np).cant = SP(np).cant + 1;
            SP(np).pol = cat(1,SP(np).pol,P(i+1,:));
            i = i+1;
        end
        if i == n
            break;
        end
        SP(np).pol(end,:) = (SP(np).pol(end-1,:)+SP(np).pol(end,:))/2;
        P = cat(1,SP(np).pol(end,:),P(i:end,:));
        np = np + 1;
        SP(np).cant = 3;
    end
elseif var == 2 % separate each subpoligonal with inflexion edge belonging to both neighbour
    while (np < N) && (~isempty(P(2:end,:)))
        n = length(P);
        s = sign(dot(P(1,:) - P(2,:),[0 -1;1 0]*(P(3,:) - P(2,:))'));
        SP(np).pol = cat(1,SP(np).pol,P(1,:),P(2,:),P(3,:));
        i = 3;
        while (i < n) && (sign(dot(P(i-1,:) - P(i,:),[0 -1;1 0]*(P(i+1,:) - P(i,:))'))==s)
            SP(np).cant = SP(np).cant + 1;
            SP(np).pol = cat(1,SP(np).pol,P(i+1,:));
            i = i+1;
        end
        if i == n
            break;
        end
        P = P(i-1:end,:);
        np = np + 1;
        SP(np).cant = 3;
    end
end


end

